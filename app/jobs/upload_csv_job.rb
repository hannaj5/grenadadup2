require 'csv'

# Runs processing of the CSV files in the background.
class UploadCsvJob < ActiveJob::Base
  queue_as :default
  def perform(file_id)
    site_file = SiteFile.find file_id

    csv_text = site_file.file.file.read

    csv = CSV.parse(
      csv_text, headers: true, converters: :numeric, encoding: 'ISO8859-1'
    )
    csv.each do |row|
      # Typically I would just mass assing but the data is a bit hetorgenous
      # so doing it attribute by attribute
      site = create_site row

      #####################
      # Handle the has_many and has_many through associations
      handle_compound_cells site, row

      site.save
    end
  end

  private

  def handle_compound_cells(site, atts)
    handle_compound_cell atts['ceramic_diagnostics'],
                         'CeramicDiagnostic',
                         site
    handle_compound_cell atts['ceramic_types'],
                         'CeramicType',
                         site
    handle_compound_cell atts['threats'],
                         'Threat',
                         site
    handle_compound_cell atts['previous_works'],
                         'PreviousWork',
                         site
  end

  # Dynamically handles processing of cells with multiple entries in the CSV
  # The default values in the opts should work in most instances.
  #
  # @param content [String] the unprocessed cell content
  # @param klass_name [String] the model name of the content being handled
  # @param site [ArcheologicalSite] the site to which the data should be added.
  # @param [Hash] opts
  # @option opts [String] :separator What to split the content on default: ';'
  # @option opts [Boolean] :strip_white_space  Whether to strip whitespace
  #                             after splitting, default: true
  # @option opts [Symbol|String] :find_by Attribute to search if item exists
  #                             and also the field to insert content on
  def handle_compound_cell(content, klass_name, _site, opts = {})
    opts = {
      separator: ';',
      strip_whitespace: true,
      find_by: :name
    }.merge(opts).with_indifferent_access

    # Skip empty or nil entries to prevent errors
    return if content.nill? || content.empyt?

    # Split  the entries and clean them up
    items = content.split(opts[:separator])
    items = items.collect(&:strip) if opts[:strip_whitespace]

    # Handle each entry
    items.each do |item|
      process_entry item, opts[:find_by], klass_name
    end
  end

  def process_entry(item, find_by, klass_name)
    item_instance = klass_name.constantize.send(
      "find_by_#{find_by}", item
    )
    if item_instance.nil?
      item_instance = klass_name.constantize
                                .create find_by.to_sym => item
    end
    site.send(klass_name.underscore.pluralize) << item_instance
  end

  def create_site(atts)
    ArcheologicalSite.new(
      site_number: atts['site_number'],
      site_name: atts['site_name'],
      parish: atts['parish'],
      latitude: atts['latitude'],
      longitude: atts['longitude'],
      location_description: atts['location_description'],
      recommendations: atts['recommendations'],
      summary: atts['summary'],
      notes: atts['notes'],
      references: atts['references']
    )
  end
end

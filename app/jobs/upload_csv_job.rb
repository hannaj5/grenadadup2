require 'csv'

class UploadCsvJob < ActiveJob::Base
  queue_as :default

  def perform(file_id)
    directory = "tmp/"
    site_file = SiteFile.find file_id
    
    csv_text = site_file.file.file.read
    
    csv = CSV.parse(csv_text, headers: true, converters: :numeric, encoding: "ISO8859-1")
    File.open(File.join(directory, 'file.txt'), 'wb+') do |f|
      f.puts "I am preforming a job with #{file_id}\n\n"
      f.puts csv.headers.join(';')
      csv.each do |row|
        f.puts "working on site id #{csv.headers.first}"
        f.puts row
        
      
        # Typically I would just mass assing but the data is a bit hetorgenous so 
        # doing it attribute by attribute
        site = ArcheologicalSite.new
        site.site_number = row['site_number']
        site.site_name = row['site_name']
        site.parish = row['parish']
        site.latitude = row['latitude']
        site.longitude = row['longitude']
        site.location_description = row['location_description']
        site.recommendations = row['recommendations']
        site.summary = row['summary']
        site.notes = row['notes']
        site.references = row['references']
        
        #####################
        # Handle the has_many and has_many through associations
        
        handle_compound_cell row['ceramic_diagnostics'], 'CeramicDiagnostic', site
        handle_compound_cell row['ceramic_types'], 'CeramicType', site
        handle_compound_cell row['threats'], 'Threat', site
        handle_compound_cell row['previous_works'], 'PreviousWork', site

        site.save
      end
    end
  end
  
  private 
    
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
    def handle_compound_cell content, klass_name, site, opts  = {}
      opts = {
        separator: ';', 
        strip_whitespace: true,
        find_by: :name
      }.merge(opts).with_indifferent_access
      
      # Skip empty or nil entries to prevent errors
      unless content.nil? || content.empty?
      
        # Split  the entries and clean them up
        items = content.split(opts[:separator])
        items = items.collect { |item| item.strip } if opts[:strip_whitespace]
        
        # Handle each entry
        items.each do |item|
          item_instance = klass_name.constantize.send("find_by_#{opts[:find_by]}", item)
          if item_instance.nil?
            item_instance = klass_name.constantize.create opts[:find_by].to_sym => item
          end
          site.send(klass_name.underscore.pluralize) << item_instance
        end
      end
    end
end


    # t.string   "site_number"
    # t.string   "site_name"
    # t.string   "parish"
    # t.float    "latitude"
    # t.float    "longitude"
    # t.text     "location_description"
    # t.text     "recommendations"
    # t.text     "summary"
    # t.text     "notes"
    # t.datetime "created_at",           null: false
    # t.datetime "updated_at",           null: false
    # t.text     "references"

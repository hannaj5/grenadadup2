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
      csv.each do |row|
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
        
        # Handle the has_many and has_many through associations
        unless row['ceramic_diagnostics'].nil? || row['ceramic_diagnostics'].empty?
          ceramic_diagnostics = row['ceramic_diagnostics'].split(';').collect{ |cd| cd.strip }
          ceramic_diagnostics.each do |cd|
            diagnostic = CeramicDiagnostic.find_by_name cd
            if diagnostic.nil?
              diagnostic = CeramicDiagnostic.create name: cd
            end
            site.ceramic_diagnostics << diagnostic
            
          end
        end
        
        
        
        
        site.save
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

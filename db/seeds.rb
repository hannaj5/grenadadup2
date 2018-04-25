# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)



default_ceramic_diagnostics = [
                        'WOR', 
                        'ZIC', 
                        'Adornos',
                        'Scratched',
                        'Finger Indented',
                        'Polychrome',
                        'Griddlefeet',
                        'Saline Wide-Handle',
                        'Calviny Unique Adorne'
                        ]
                        
default_ceramic_diagnostics.each do |diagnostic|
  CeramicDiagnostic.create name: diagnostic
end

default_cerarmic_types = [
                      'Unknown',
                      'Historic',
                      'General Post-Saladoid',
                      'Cayoid',
                      'Suazan Troumassoid',
                      'Troumassan Troumassoid',
                      'Saladoid-Barranqoid',
                      'Early Saladoid'
                      ]

default_cerarmic_types.each do |ceramic_type|
  CeramicType.create name: ceramic_type
end

default_threats = [
                    'Erosion',
                    'Sand Mining',
                    'Construction/Development',
                    'Illegal Dumping',
                    'Looting',
                    'Vanalism',
                    'Tourism Impacts',
                    'Unknown',
                    'Already Destroyed'
                    ]
  
default_threats.each do |threat|
  Threat.create name: threat
end

if Rails.env.production?
  unless User.find_by_email 'admin@example.com'
    FactoryGirl.create :admin, email: 'admin@example.com'
  end
end

if Rails.env.development? 
  # User.destroy_all
  # FactoryGirl.create :admin, email: 'admin@example.com'
  # FactoryGirl.create :editor, email: 'editor@example.com'
  # FactoryGirl.create :user, email: 'user@example.com'
  
  # FactoryGirl.create_list :editor, 5
  # FactoryGirl.create_list :user, 100
  
  # 10.times do 
  #   PreviousWork.create name: Faker::Name.name
  # end
  
  # 20.times do
  #   site = ArchaeologicalSite.new(
  #     site_number: Faker::Lorem.characters(10),
  #     site_name: Faker::Company.name,
  #     parish: Faker::LordOfTheRings.location,
  #     latitude: rand() * (90 + 90) - 90,
  #     longitude: rand() * (180 + 180) - 180,
  #     location_description: Faker::Hipster.paragraph,
  #     recommendations: Faker::TwinPeaks.quote,
  #     summary: Faker::ChuckNorris.fact,
  #     notes: Faker::Lorem.paragraph,
  #     references: Faker::Lorem.sentence

  #     )
      
  #   site.ceramic_types = CeramicType.all.sample(rand(CeramicType.count + 1))
  #   site.ceramic_diagnostics = CeramicDiagnostic.all.sample(
  #     rand(CeramicDiagnostic.count + 1))
  #   site.previous_works = PreviousWork.all.sample(rand(PreviousWork.count + 1))
  #   site.threats = Threat.all.sample(rand(Threat.count + 1))
  #   site.save
  # end
end
User.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?
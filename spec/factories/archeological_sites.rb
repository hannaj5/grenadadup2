FactoryGirl.define do
  factory :archeological_site do
    site_number 'MyString'
    site_name 'MyString'
    parish 'MyString'
    latitude 1.5
    longitude 1.5
    location_description 'MyText'
    recommendations 'MyText'
    summary 'MyText'
    notes 'MyText'
  end
end

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

FactoryGirl.create :admin, email: 'admin@example.com'
FactoryGirl.create :editor, email: 'editor@example.com'
FactoryGirl.create :user, email: 'user@example.com'

FactoryGirl.create_list :editor, 5
FactoryGirl.create_list :user, 100


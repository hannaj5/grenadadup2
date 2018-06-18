#This is for Heroku
web: bin/rails server -p $PORT -e $RAILS_ENV
worker: bundle exec rake jobs:work
heroku ps:scale worker=1
web: bundle exec rails server -e $RAILS_ENV --port=$PORT --binding=$HOST
worker: bundle exec sidekiq -C config/sidekiq.yml

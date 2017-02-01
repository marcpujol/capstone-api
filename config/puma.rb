workers Integer(ENV['WEB_CONCURRENCY'] || 2)
threads_count = Integer(ENV['RAILS_MAX_THREADS'] || 5)
threads threads_count, threads_count

preload_app!

rackup		DefaultRackup
port		ENV['PORT'] || 3000
environment	ENV['RACK_ENV'] || 'development'

on_worker_boot do
    # setup for rails 4.1+ . see heroku documentation related (puma on-worker-boot)
    ActiveRecord::Base.establish_connection
end	

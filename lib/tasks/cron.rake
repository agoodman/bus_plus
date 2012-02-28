task :cron => :environment do
  
  # prune passengers older than 6hrs
  Passenger.where('created_at < ?',Time.now-6.hours).destroy_all
  
end

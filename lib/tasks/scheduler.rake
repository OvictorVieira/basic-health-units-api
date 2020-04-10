desc "This task is called by the Heroku scheduler add-on"

task :update_feed => :environment do
  puts 'Running routine for creating ubs'

  GetAllOperationInstitutes.fetch

  puts 'Done'
end
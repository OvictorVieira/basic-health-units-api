desc "This task is called by the Heroku scheduler add-on"

task :enqueue_ubs_import => :environment do
  puts 'Running routine for creating ubs'

  GetAllOperationInstitutes.fetch

  puts 'Done'
end
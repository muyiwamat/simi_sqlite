namespace :csv do

  desc "Import CSV Data"
  task :import => :environment do

    require 'csv'

    csv_file_path = 'lib/tasks/libraries.csv'

    CSV.foreach(csv_file_path, headers: true) do |row|
      row = Library.create!({
        :name => row[0],
        :address => row[1],
        :postcode => row[2],
        :dialling => row[3], 
        :telephone => row[4],
        :email => row[5],
        :access_details => row[6]
      })
      puts "Row added!"
    end
  end
end
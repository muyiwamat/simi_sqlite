namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    admin = User.create!(email: "example@yahoo.com",
                 password: "ayodele",
                 password_confirmation: "ayodele",
                 address: "Aberdeen",
                 postcode: "AB24 1WU")
     admin.toggle!(:admin)
    1.times do |n|
      email = "example-#{n+1}@yahoo.com"
      password  = "password"
      User.create!(email: email,
                   password: password,
                   password_confirmation: password,
                   address: address,
                   postcode: postcode)
    end
  end
end
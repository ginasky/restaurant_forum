namespace :dev do
  task fake:  :environment do
    Restaurant.destroy_all

    200.times do |i|
      Restaurant.create!(name: FFaker::Name.first_name,
      opening_hours: FFaker::Time.datetime,
      tel: FFaker::PhoneNumber.short_phone_number,
      address: FFaker::Address.street_address,
      description: FFaker::Lorem.paragraph,
      category: Category.all.sample,
      image: File.open(File.join(Rails.root, "public/seed_img/#{rand(0...25)}.jpg"))
      )
    end
    puts "have created fake restaurant"
    puts "now we have #{Restaurant.count} restaurants data"
  end
end

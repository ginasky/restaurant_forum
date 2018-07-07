namespace :dev do
  task fake_restaurant:  :environment do
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

  task fake_user:  :environment do
    20.times do |i|
      User.create!(
      email: FFaker::Internet.email,
      password: "123456"

      )
    end
  end

  task fake_comment:  :environment do
    Comment.destroy_all
    @restaurants=Restaurant.all
    @restaurants.each do |restaurant|
      3.times do |i|
        Comment.create!(
        content: FFaker::Lorem.paragraph,
        restaurant_id: restaurant.id,
        user_id: "#{rand(1..20)}"
        )
      end
    end
  end

end

# Seed Barbecues
10.times do
  title = [ "#{Faker::Team.name} victory BBQ", "#{Faker::Name.name} Birthday BBQ" ].sample
  venue = [ Faker::Address.city, Faker::Company.name ].sample

  puts "Creating #{title} at #{venue}"
  Barbecue.create(date: Faker::Date.forward(23), title: title, venue: venue)
end

10.times do
  name = [ Faker::Name.name ].sample
  email = [ Faker::Internet.email].sample

  puts "#{name}, #{email}"
  User.create(name: name, email: email, password:12345678, password_confirmation:12345678)
end

User.create(name: 'Lara', email: 'larascully@hotmail.com', password:12345678, password_confirmation:12345678)

20.times do
  name = [ Faker::Lorem.word ].sample
  puts "#{name}"
  Item.create(name: name, barbecue_id: rand(10)+1, user_id: rand(10)+1)
end
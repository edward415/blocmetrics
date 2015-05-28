require 'faker'

10.times do
  user = User.new(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    password: Faker::Lorem.characters(10)
    )
    user.skip_confirmation!
    user.save!
end

admin = User.new(
  name:     'Admin User',
  email:    'admin@example.com',
  password: 'helloworld',
)
admin.skip_confirmation!
admin.save!
 
 # Create a member
member = User.new(
  name:     'Member User',
  email:    'member@example.com',
  password: 'helloworld'
)
member.skip_confirmation!
member.save!

users = User.all

200.times do 
    App.create!(
      name: Faker::Internet.domain_word,
      url: Faker::Internet.url,
      user: users.sample
      )
end

apps = App.all

1000.times do
  Event.create!(
    name: ["pageview", "session", "bounce", "users", "US", "Asia", "Chrome Desktop", "Safari iOS"].sample,
    app: apps.sample
    )
end
events = Event.all



puts "Done seeding"
puts "#{User.count} users created"
puts "#{App.count} apps created"
puts "#{Event.count} events created"
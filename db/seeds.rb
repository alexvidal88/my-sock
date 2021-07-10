# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#
#
#  t.string "name"
#   t.integer "price"
#   t.text "description"
#

user = User.create(first_name: "user", last_name: "test", email: "user@user.com", password: "password")
data = File.read('public/socks_seeds.json')
new_socks = JSON.parse(data)
new_socks['socks'].each do |new_sock|
  created_sock = Sock.new(
    name: new_sock['name'],
    price: new_sock['price'],
    description: new_sock['description'],
    address: new_sock["address"]
  )


 file = URI.open(new_sock['photo'])
 created_sock.photo.attach(io: file, filename: "#{created_sock.name}.jpg", content_type: 'image/jpg')
 created_sock.user = user
 created_sock.save!
end


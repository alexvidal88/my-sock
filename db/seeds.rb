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
data = File.read('public/socks_seeds.json')
new_socks = JSON.parse(data)
new_socks['socks'].each do |new_sock|
  created_sock = Sock.new(
    name: new_plant['name'],
    price: new_plant['price'],
    description: new_plant['description']
  )
end

 file = URI.open(new_sock['image.url'])
 created_sock.photo.attach(io: file, filename: "#{created_sock.name}.jpg", content_type: 'image/jpg')
 created_sock.save!

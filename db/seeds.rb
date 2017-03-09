# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

conference1 = Conference.create(name: 'ACM Conference1', acronym: 'ACM1')
conference2 = Conference.create(name: 'ACM Conference2', acronym: 'ACM2')

track1 = conference1.tracks.build(name:'Operating Systems', acronym: 'OS')
track2 = conference1.tracks.build(name:'Algorithms', acronym: 'AG')
conference1.tracks.build(name:'Machine Learning', acronym: 'ML')

conference2.tracks.build(name:'Computer Vision', acronym: 'CV')
conference2.tracks.build(name:'Speech Recognition', acronym: 'SR')

conference1.save
conference2.save

user1 = User.create(name: 'Wesley Cook')
user2 = User.create(name: 'Sean Holcomb')
user3 = User.create(name: 'Benjamin Hafer')

user1.save
user2.save
user3.save

track1.user_roles.build(user_id: user1, role: 'Chairman')
track1.user_roles.build(user_id: user2, role: 'Reviewer')

track2.user_roles.build(user_id: user3, role: 'Track Chair')



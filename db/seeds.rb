# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#

users = User.create([ { email: 'email_test_1', encrypted_password: 'password1' }, { email: 'email_test_2', encrypted_password: 'password2' }, { email: 'email_test_3', encrypted_password: 'password3' } ])
parents = Parent.create([ { first_name: 'Jean-Claude', last_name: 'Dus', birthdate: Date.new(1990, 11, 10), user: User.first }, { first_name: 'Rachelle', last_name: 'Layant', birthdate: Date.new(1974, 1, 12), user: User.second }, { first_name: 'Carlos', last_name: 'de Griaziales', birthdate: Date.new(2001, 8, 26), user: User.third } ])

puts('Users created', 'Parents created')

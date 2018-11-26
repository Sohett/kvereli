parents = Parent.create!([
   { email: 'email_test_1@test.com', first_name: 'Hector', last_name: 'Lagaffe', birthdate: Date.new(1980, 2, 12), password: 'password1' },
   { email: 'email_test_2@test.com', first_name: 'Phillipe', last_name: 'Hdoehjfd', birthdate: Date.new(1963, 11, 23), password: 'password2' },
   { email: 'email_test_3@test.com', first_name: 'Nico', last_name: 'le Grand', birthdate: Date.new(1945, 1, 9), password: 'password3' },
   { email: 'email_test_4@test.com', first_name: 'Jean', last_name: 'Lagaffe', birthdate: Date.new(1978, 4, 12), password: 'password4' } ])

kids = Kid.create!([
  { first_name: 'Valentin', last_name: 'Hviegw', parent: Parent.first, birthdate: Date.new(2000, 11, 24) },
  { first_name: 'Jean', last_name: 'Hviegw', parent: Parent.first, birthdate: Date.new(2009, 2, 4) },
  { first_name: 'Clemence', last_name: 'Hviegw', parent: Parent.second, birthdate: Date.new(2010, 11, 24) },
  { first_name: 'Astrid', last_name: 'Hviegw', parent: Parent.second, birthdate: Date.new(2010, 11, 24) },
  { first_name: 'Chloe', last_name: 'Hviegw', parent: Parent.third, birthdate: Date.new(2010, 11, 24) },
  { first_name: 'Victor', last_name: 'Hviegw', parent: Parent.third, birthdate: Date.new(2010, 11, 24) },
  { first_name: 'Julie', last_name: 'Hviegw', parent: Parent.third, birthdate: Date.new(2010, 11, 24) },
  { first_name: 'Thomas', last_name: 'Hviegw', parent: Parent.fourth, birthdate: Date.new(2010, 11, 24) }
])

puts('Parents created', 'Kids created')

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

authors = User.create!([
  {name: 'Andor', email: 'cassiandor@rebels.com', password: 'cassiandor'},
  {name: 'Luthen Rael', email: 'luthenrael@rebels.com', password: 'luthen'},
  {name: 'Bix Caleen', email: 'bixcaleen@rebels.com', password: 'bixcaleen'},
  {name: 'Syril Karn', email: 'syrilkarn@empire.com', password: 'syrilkarn'},
  {name: 'S.Linus Mosk', email: 'linusmosk@empire.com', password: 'linusmosk'},
  {name: 'Maarva Andor', email: 'maarva@rebels.com', password: 'maarva'},
  {name: 'Saw Gerrera', email: 'sawgerrera@rebels.com', password: 'sawgerrera'},
  {name: 'John Doe', email: 'john@doe.com', password: 'johndoe'}
])

categories = Group.create!([
  {author: authors[0], name: 'Movies', icon: 'https://cdn-icons-png.flaticon.com/512/3163/3163478.png'},
  {author: authors[0], name: 'Food', icon: 'https://cdn-icons-png.flaticon.com/512/706/706164.png'},
  {author: authors[0], name: 'Clothes', icon: 'https://cdn-icons-png.flaticon.com/512/2230/2230876.png'},
  {author: authors[0], name: 'Travel', icon: 'https://cdn-icons-png.flaticon.com/512/2200/2200326.png'},
  {author: authors[1], name: 'Books', icon: 'https://cdn-icons-png.flaticon.com/512/3389/3389081.png'},
  {author: authors[1], name: 'Food', icon: 'https://cdn-icons-png.flaticon.com/512/706/706164.png'},
  {author: authors[1], name: 'Clothes', icon: 'https://cdn-icons-png.flaticon.com/512/2230/2230876.png'},
  {author: authors[2], name: 'Travel', icon: 'https://cdn-icons-png.flaticon.com/512/2200/2200326.png'},
  {author: authors[3], name: 'Movies', icon: 'https://cdn-icons-png.flaticon.com/512/3163/3163478.png'},
])

expenses = Expense.create!([
  {author: authors[0], name: 'Avengers: Infinity', amount: 8.99, groups: [categories[0]]},
  {author: authors[0], name: 'Avengers: Endgame', amount: 10.99, groups: [categories[0]]},
  {author: authors[0], name: 'Avengers: Age of Ultron', amount: 12.99, groups: [categories[0]]},
  {author: authors[0], name: 'Tomato Sauce', amount: 14.99, groups: [categories[1]]},
  {author: authors[0], name: 'Tomato Paste', amount: 16.99, groups: [categories[1]]},
  {author: authors[0], name: 'Tomato Ketchup', amount: 18.99, groups: [categories[1]]},
  {author: authors[0], name: 'Tomato Juice', amount: 20.99, groups: [categories[1]]},

])
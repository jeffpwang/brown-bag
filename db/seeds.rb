# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


jeff = User.create(name: "Jeff")
vacation = Goal.create(name: "Spring Break", goal_amount: "420", saved_amount: "0")
coffee = Saving.create(category: "Coffee", amount: "3")

vacation.savings << coffee
jeff.goals << vacation



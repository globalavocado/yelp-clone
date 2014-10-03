Restaurant.destroy_all
Review.destroy_all

kfc = Restaurant.create(:name => "KFC")
kfc.reviews.create(rating: 1, musings: "borderline food poisoning")
kfc.reviews.create(rating: 2, musings: "on the edge")
kfc.reviews.create(rating: 3, musings: "okay")
kfc.reviews.create(rating: 4, musings: "pretty good")
kfc.reviews.create(rating: 5, musings: "phenomenal")

jamies = Restaurant.create(:name => "Jamie's Italian")
jamies.reviews.create(rating: 1, musings: "borderline food poisoning")
jamies.reviews.create(rating: 2, musings: "on the edge")
jamies.reviews.create(rating: 3, musings: "okay")
jamies.reviews.create(rating: 4, musings: "pretty good")
jamies.reviews.create(rating: 5, musings: "phenomenal")


# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

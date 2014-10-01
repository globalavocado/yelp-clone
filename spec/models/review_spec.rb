require 'rails_helper'

RSpec.describe Review, :type => :model do
	it 'cannot have a rating greater than 5' do
		restaurant = Restaurant.create(name: "The Ivies")
		review = restaurant.reviews.create(musings: "Pretty great!", rating: 6)
		expect(review).to have(1).error_on(:rating)
	end  

	

end

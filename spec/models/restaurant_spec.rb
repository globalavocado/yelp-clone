require 'rails_helper'


RSpec.describe Restaurant, :type => :model do
	it 'is not valid with a name of less than 3 characters' do
		restaurant = Restaurant.new(name: 'kf')
		expect(restaurant).to have(1).error_on(:name)
		expect(restaurant).not_to be_valid
	end

  	it 'is not valid unless it is a unique name' do
  		Restaurant.create(name: "Jamie's Italian")
  		restaurant = Restaurant.new(name: "Jamie's Italian")
  		expect(restaurant).to have(1).error_on(:name)
  	end
end

describe '#average_rating' do
  context 'no reviews' do
    it 'returns N/A' do
      restaurant = Restaurant.create(name: 'The Ivy')
      expect(restaurant.average_rating).to eq 'N/A'
    end
  end


  context '1 review' do
    it 'returns that rating' do
      restaurant = Restaurant.create(name: 'The Ivy')
      restaurant.reviews.create(rating: 4)
      expect(restaurant.average_rating).to eq 4
    end
  end

  context 'multiple reviews' do
    it 'returns the average' do
      restaurant = Restaurant.create(name: 'The Ivy')
      restaurant.reviews.create(rating: 3)
      restaurant.reviews.create(rating: 5)
      expect(restaurant.average_rating).to eq 4
    end
  end
end
require 'rails_helper'

RSpec.describe Restaurant, :type => :model do
	it 'is not valid with a name of less than 3 characters' do
		restaurant = Restaurant.new(name: 'kf')
		expect(restaurant).to have(1).error_on(:name)
		expect(restaurant).not_to be_valid
	end

  # pending "add some examples to (or delete) #{__FILE__}"

  	it 'is not valid unless it is a unique name' do
  		Restaurant.create(name: "Jamie's Italian")
  		restaurant = Restaurant.new(name: "Jamie's Italian")
  		expect(restaurant).to have(1).error_on(:name)
  	end
end

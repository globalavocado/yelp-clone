require 'rails_helper'

describe 'endorsing reviews' do
	before do
		kfc = Restaurant.create(name: 'KFC')
		kfc.reviews.create(rating: 3, musings: "OK")
	end

	it 'can update the review endorsement count', js: true do
		visit '/restaurants'
		click_link 'endorse this review'
		expect(page).to have_content ('1 endorsement')
	end
end

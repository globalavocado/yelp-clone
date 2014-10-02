require 'rails_helper'

describe 'reviewing' do
	before do
		Restaurant.create(name:'The Ivy')
	end

def leave_review(musings, rating)
		visit '/restaurants'
		click_link 'review The Ivy'
		fill_in 'Musings', with: musings
		select rating, from: 'Rating'
		click_button 'leave review'
	end

	it 'allows users to leave reviews using the form which appears alongside restaurants' do
		visit '/restaurants'
		expect(current_path).to eq '/restaurants'
		click_link 'review The Ivy'
		fill_in 'Musings', with: 'so-so'
		expect(page).to have_content 'so-so'
	end

	it 'displays an average rating for all reviews' do
		leave_review('so-so', '3')
		expect(current_path).to eq '/restaurants'
		expect(page).to have_content 'so-so'
		expect(page).to have_content '3'
	end

	it 'displays an average rating for all reviews' do
		leave_review('so-so', '3')
		
	end

end
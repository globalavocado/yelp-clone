require 'rails_helper'

describe 'reviewing' do
	before do
		Restaurant.create(name:'The Ivy')
	end

	it 'allows users to leave reviews using the form which appears alongside restaurants' do
		visit '/restaurants'
		click_link 'review The Ivy'
		fill_in 'Musings', with: 'so-so'
		select '3', from: 'Rating'
		click_button 'leave review'
		expect(current_path).to eq '/restaurants'
		expect(page).to have_content 'so-so'
	end
end
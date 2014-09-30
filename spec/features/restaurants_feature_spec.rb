require 'rails_helper'

describe 'restaurants' do
	context 'no restaurants have been added' do
		it 'should display a prompt to add a restaurant' do
			visit '/restaurants'
			expect(page).to have_content 'no restaurants yet'
			expect(page).to have_link 'add a restaurant'
		end
	end

	context 'restaurants have been added' do
		before do
			Restaurant.create(name:'The Ivy')
		end

		it 'should display them' do
			visit '/restaurants'
			expect(page).to have_content('The Ivy')
			expect(page).to_not have_content ('no restaurants yet')
		end
	end
end

describe 'creating restaurants' do

	context 'a valid restaurant' do

		 it 'prompts the user to fill out a form then displays the new restaurant' do
		    visit '/restaurants'
		    click_link 'add a restaurant'
		    fill_in 'Name', with: 'The Ivy'
		    click_button 'Create Restaurant'
		    expect(page).to have_content('The Ivy')
		    expect(current_path).to eq '/restaurants'
  		end
  	end
end


	context 'editing restaurants' do
		before do
			Restaurant.create(name:'The Ivy')
		end

		it 'can allow a user to edit a restaurant' do
			visit '/restaurants'
			click_link 'edit The Ivy'
			fill_in 'Name', :with => 'the poshest restaurant in town'
			click_button 'Update Restaurant'
			expect(page).to have_content 'the poshest restaurant in town'
			expect(current_path).to eq '/restaurants'
		end
	end

	context 'an invalid restaurant' do
		it 'does not let you submit without a name that is too short' do
			visit '/restaurants'
			click_link 'add a restaurant'
			fill_in 'Name', with: 'kf'
			click_button 'Create Restaurant'
			expect(page).not_to have_css 'h2', text: 'kf'
			expect(page).to have_content 'error'
		end
	end

	context 'deleting restaurants' do
		before do
			Restaurant.create(name:'The Ivy')
		end

		it 'removes a restaurant when a user clicks the delete link' do
			visit '/restaurants'
			click_link 'delete The Ivy'
			expect(page).not_to have_content 'The Ivy'
			expect(page).to have_content 'Restaurant deleted successfully'
		end
	end

	context 'show individual restaurant details' do
		before do
			Restaurant.create(name:'The Ivy', description:'the poshest restaurant in town')
		end

		it 'has a separate page with the restaurant details' do
			visit '/restaurants'
			click_link 'show The Ivy'
			expect(page).to have_content 'The Ivy'
		end
	end



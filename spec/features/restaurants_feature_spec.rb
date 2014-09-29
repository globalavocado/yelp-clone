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

	context 'adding new restaurants' do
		it 'should have a page to add a new restaurant' do
			visit '/restaurants'
			click_on 'add a restaurant'
			expect(current_path).to eq '/restaurants/new'
		end

		it 'should have a form to add a new restaurant' do
			visit '/restaurants/new'
			expect(page).to have_field('restaurant_name')
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
end


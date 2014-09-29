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

	
end


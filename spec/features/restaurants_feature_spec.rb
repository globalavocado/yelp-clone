describe 'restaurants' do
	context 'no restaurants have been added' do
		it 'should display a prompt to add a restaurant' do
			visit '/restaurants'
			expect(page).to have_content 'no restaurants yet'
			expect(page).to have_link 'add a restaurant'
		end
	end
end
require 'rails_helper'

describe ReviewsHelper, :type => :helper do

	context '#star_rating' do
		it 'does nothing for not a number' do
			expect(helper.star_rating('N/A')).to eq 'N/A'
		end

		it 'returns 5 black stars for 5' do
			expect(helper.star_rating(5)).to eq '★★★★★'
		end
	end
end
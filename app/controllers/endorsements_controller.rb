class EndorsementsController < ApplicationController
	
def index
end

def create
	@review = Review.find(params[:review_id])
	@review.endorsements.create
	
	render json: {new_endorsements_count: @review.endorsements.count}
end

end

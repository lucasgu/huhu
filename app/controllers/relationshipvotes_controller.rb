class RelationshipvotesController < ApplicationController
before_action :logged_in_user

	def create
@answerquestion = Answerquestion.find(params[:voted_id])
 
current_user.vote(@answerquestion)
redirect_to @answerquestion
end
def destroy
@answerquestion = Relationshipvote.find(params[:id]).voted 
current_user.unvote(@answerquestion)
redirect_to @answerquestion
end


end




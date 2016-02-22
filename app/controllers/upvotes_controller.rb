class UpvotesController < ApplicationController
  def create
        secure_post = params.require(:upvote).permit(:state, :answerquestion_id)
        @upvote = current_user.upvotes.build(secure_post) 
        if @commentstate.save
           flash[:success] = "Submit successfully!"
           @answerquestion = Answerquestion.find(@upvote.answerquestion_id)
           redirect_to @answerquestion
        else
           render @answerquestion
        end
    end
    end
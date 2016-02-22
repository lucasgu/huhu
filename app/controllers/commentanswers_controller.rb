class CommentanswersController < ApplicationController


def create
    @answerquestion = Answerquestion.find(params[:answerquestion_id])
    @commentanswer = @answerquestion.commentanswers.create(comment_params)
    redirect_to answerquestion_path(@answerquestion)
  end




  private
    def comment_params
      params.require(:commentanswer).permit(:commenter, :body)
    end
end

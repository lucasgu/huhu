class AnswerquestionsController < ApplicationController
before_action :logged_in_user



def create

    @askquestion = Askquestion.find(params[:askquestion_id])
    secure_post = params.require(:answerquestion).permit(:content,:askquestion_id)
      

    @answerquestion = @askquestion.answerquestions.create(params[:answerquestion].permit(:content))
      
    @answerquestion = current_user.answerquestions.build(secure_post)
        
      
    if  @answerquestion.save 
      
     # current_user.questions <<@question

        redirect_to askquestion_path(@askquestion)
    else
        render  'new'
    end
  end


end

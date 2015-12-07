class QuestionsController < ApplicationController
before_action :logged_in_user


def index
    @questions = Question.all
  end


def new

@question=Question.new
end



def create
    secure_params = params.require(:question).                                         
                      permit(:name)
    
     @question = Question.new(secure_params)
      
    
      secure_post = params.require(:question).permit(:content,:name)
        @question = current_user.questions.build(secure_post)
    

    if  @question.save 

     # current_user.questions <<@question

        redirect_to action: 'index', notice: 'Question was successfully created.'
    else
        render action: "new" 
    end
  end






end

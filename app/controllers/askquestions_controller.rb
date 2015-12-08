class AskquestionsController < ApplicationController
before_action :logged_in_user
  before_action :find_post ,only: :show



def index
    @askquestions = Askquestion.all
  end


def new

@askquestion=Askquestion.new
end



def create
      
    secure_params = params.require(:askquestion).                                         
                      permit(:name)
    
     @askquestion = Askquestion.new(secure_params)
      
    
      secure_post = params.require(:askquestion).permit(:content,:name,:topic_id)
        @askquestion = current_user.askquestions.build(secure_post)
        

    if  @askquestion.save 

     # current_user.questions <<@question

      redirect_to action: 'index', notice: 'Question was successfully created.'
    else
        render action: "new" 
    end

  

  end

private 

  def find_post
    @askquestion = Askquestion.find(params[:id])
  end
  def post_params
    params.require(:askquestion).permit(:name, :content)
  end

  






end

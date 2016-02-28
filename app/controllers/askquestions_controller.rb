class AskquestionsController < ApplicationController
before_action :logged_in_user
  before_action :find_post ,only: :show



def index
    @askquestions = Askquestion.all
  end


def new

@askquestion=Askquestion.new
end


def bindvote

    @answerquestion = Answerquestion.find(params[:id])
    @id2= @answerquestion.askquestion_id
    @askquestion1=Askquestion.find_by(params[@id2])
    
#(id: user_id)
     

 # if current_user.votes.find_by(id: params[:id])==nil



      
           # if @answerquestion = Relationshipvote.find(params[:id]).voted 

         # if current_user.topics.find_by(params[:id])==nil
       if current_user.voted?(@answerquestion) 
          
             current_user.unvote(@answerquestion)

          redirect_to askquestion_path(@askquestion1),notice: 'Do not  liek  it  .'  


    else
         current_user.vote(@answerquestion)


          redirect_to askquestion_path(@askquestion1),notice: 'like it now .'  
   


     end
     # else 
        #  redirect_to askquestion_path(@askquestion1),notice: 'like it now .'  

#end 

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

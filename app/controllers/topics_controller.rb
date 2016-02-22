
class TopicsController < ApplicationController
  before_action :logged_in_user


  def index
    @topics = Topic.all
  end




  def show 
    @topic=current_user.topics
    @topic=Topic.find(params[:id])
    

  end




  def new

    @topic=Topic.new

  end



  def disbind 
    
#(id: user_id)
   
  # if current_user.topics.find_by(params[:id])==nil
      @tag=current_user.topics.find_by(id: params[:id])
       
      current_user.topics.delete(@tag)

       redirect_to topics_path
  
    

  end



  def bind

    @topic = Topic.find(params[:id])
#(id: user_id)

  if current_user.topics.find_by(id: params[:id])==nil
   
  # if current_user.topics.find_by(params[:id])==nil
      current_user.topics<<@topic
       redirect_to topics_path
   
    else
      
redirect_to topics_path, notice: 'Topic was successfully haveed.'    

     

    end


  end


  def create
    secure_params = params.require(:topic).                                         
    permit(:name)
    
    @topic = Topic.new(secure_params)
    
    


    if  @topic.save 
      current_user.topics <<@topic

      redirect_to action: 'index', notice: 'Topic was successfully created.'
    else
      render action: "new" 
    end
  end


end



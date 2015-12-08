
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


 
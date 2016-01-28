class UsersController < ApplicationController
  
before_action :logged_in_user, only: [:index,:edit, :update, :destroy, :following, :followers]#new in 11 14
before_action :admin_user, only: :destroy
  def show
        @user = User.find(params[:id])
        @microposts = @user.microposts
  end
     def create
        secure_params = params.require(:user).permit(:name, :email, 
                                  :password, :password_confirmation,:description)
        @user = User.new(secure_params)
        if @user.save
         remember @user 
                   log_in @user      #  NEW LINE
        flash[:success] = "Welcome to the Twitter App!"    # NEW LINE
          redirect_to @user   # NEW LINE
 # Handle a successful save.
        else
          render 'new'
  # Handle an unsuccessful save.     
        end
      end


        def new
        	 @user = User.new
        end



        def index
@users = User.paginate(page: params[:page])       
 end #2015 11 14 new line

def edit 
  @user=User.find(params[:id])
end

def destroy
        User.find(params[:id]).destroy
        flash[:success] = "User deleted"
        redirect_to users_url
end

def following
        @title = "Following"
        @user  = User.find(params[:id])
        @users = @user.following.paginate(page: params[:page])
        render 'show_follow'
end



def followers
@title = "Followers"
@user = User.find(params[:id])
@users = @user.followers.paginate(page: params[:page]) 
render 'show_follow'
end












def update
@user = User.find(params[:id])
if @user.update_attributes(user_params)
   flash[:success] = "Profile updated"
redirect_to @user

else
render 'edit' 
end

end

private
def user_params
params.require(:user).permit(:name, :email, :password,
                                       :password_confirmation)
end


def admin_user
  redirect_to(root_url) unless current_user.admin?

end

end

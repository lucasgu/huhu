class UsersController < ApplicationController
  
before_action :logged_in_user, only: [:index]#new in 11 14

  def show
        @user = User.find(params[:id])
        @microposts = @user.microposts
  end
     def create
        secure_params = params.require(:user).permit(:name, :email, 
                                  :password, :password_confirmation)
        @user = User.new(secure_params)
        if @user.save
         remember @user       #  NEW LINE

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
          @users=User.all
        end #2015 11 14 new line










end

class UsersController < ApplicationController

   def index
      @groups=Group.where(user: current_user).all
      @all_groups=Group.all
      @user=current_user
   end

   def new
      @user=User.new
   end

   def login
   end

   def create
      @location=Location.existsOrCreate(params[:location][:city], params[:location][:state])

      @user=User.new(user_params)
      @user.location=@location

      if @user.save && @location.valid?

         flash[:notice]=["Registered Successfully"]

         session[:user_id]=@user.id

         return redirect_to users_path

      end

      errors=@user.errors.full_messages+@location.errors.full_messages

      flash[:errors]=errors

      return redirect_to new_user_path
   end

   def new_guest
   end

   def edit
   end


   def update
      @location=Location.existsOrCreate(params[:location][:city], params[:location][:state])

      @user=current_user

      if @user.update(user_params) && @location.valid?
         flash[:notice]=["User Updated"]
         return redirect_to users_path
      end

      errors=@user.errors.full_messages + @location.errors.full_messages

      flash[:errors]=errors

      return redirect_to edit_users_path

   end

   private
      def user_params
         params.require(:user).permit(:firstName, :lastName, :email, :password, :image).merge(location: @location)
      end

end

class SessionsController < ApplicationController

   def create
      @user=User.find_by_email(params[:email])

      if @user
         if @user.try(:authenticate, params[:password])
            session[:user_id]=@user.id
            return redirect_to users_path
         end
         flash[:errors]=["Password is Invalid."]

      end

      flash[:errors]=['Email Account is Invalid.']

      return redirect_to new_user_path
   end

   def create_guest
      @user=User.find_by_email(params[:email])

      if @user
         if @user.try(:authenticate, params[:password])
            session[:guest_id]=@user.id
            return redirect_to users_path
         end
         flash[:errors]=["Password is Invalid."]

      end

      flash[:errors]=['Email Account is Invalid.']

      return redirect_to new_guest_users_path
   end

   def destroy
      session.clear
      return redirect_to root_path
   end

end

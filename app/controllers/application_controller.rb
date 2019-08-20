class ApplicationController < ActionController::Base


   def current_user
      return User.find(session[:user_id]) if session[:user_id]
   end

   def current_guest
      return User.find(session[:guest_id]) if session[:guest_id]
   end

   helper_method :current_user
   helper_method :current_guest

   private

      def require_user_login
         if !(session[:user_id])
            return redirect_to login_users_path
         end
      end
end

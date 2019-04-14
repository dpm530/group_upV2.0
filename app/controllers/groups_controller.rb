class GroupsController < ApplicationController

   def index
      @groups=Group.all
   end

   def new
   end

   def create
      @location=Location.existsOrCreate(params[:location][:city], params[:location][:state])

      @group=Group.new(group_params)


      if @group.save && @location.valid?
         flash[:notice]=["New Group Created."]

         return redirect_to users_path
      end

      errors=@group.errors.full_messages+@location.errors.full_messages

      flash[:errors]=errors

      return redirect_to new_group_path
   end

   private
      def group_params
         params.require(:group).permit(:name, :description).merge(user: current_user).merge(location: @location)
      end


end

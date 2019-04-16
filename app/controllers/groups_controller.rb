class GroupsController < ApplicationController

   def index
      @groups=Group.all
   end

   def new
   end

   def show
      @group=Group.find(params[:id])
      @events=Event.where(group: @group).all
      @discussions=Discussion.where(group: @group).all

      puts "="*100
      puts (@group.users.include? current_user)
      puts "="*100
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

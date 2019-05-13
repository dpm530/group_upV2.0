class GroupsController < ApplicationController

   def index
      @groups=Group.all
   end

   def new
      @categories=["Outdoor & Adventure","Tech","Family","Sports & Fitness","Photography","Food & Drink","Language & Culture","Movements","Pets","Sci-Fi & Games","Social","Career & Business"]
   end

   def show
      @group=Group.find(params[:id])
      @user_posts=@group.user_posts
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

   def edit
      @categories=["Outdoor & Adventure","Tech","Family","Sports & Fitness","Photography","Food & Drink","Language & Culture","Movements","Pets","Sci-Fi & Games","Social","Career & Business"]
      @group=Group.find(params[:id])
   end

   def update
      @group=Group.find(params[:id])
      @location=Location.existsOrCreate(params[:location][:city], params[:location][:state])

      if @location.valid?
         if @group.update(group_params)
            flash[:notice]=["Updated Group"]

            return redirect_to group_path
         end
      end

      errors=@group.errors.full_messages + @location.errors.full_messages

      flash[:errors]=errors
      return redirect_to edit_group_path
   end

   def destroy
      puts "="*100
      puts "Inside Destroy method"
      puts "="*100
      @group=Group.find(params[:id])

      @group.destroy

      return redirect_to groups_path
   end



   private
      def group_params
         params.require(:group).permit(:name, :description, :category, :image).merge(user: current_user).merge(location: @location)
      end


end

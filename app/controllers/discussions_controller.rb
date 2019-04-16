class DiscussionsController < ApplicationController

   def create_discussion
      @group=Group.find(params[:id])
      @discussion=Discussion.new(discussion_params)

      if @discussion.save
         flash[:notice]=["New Discussion Created."]

         return redirect_to group_path
      end

      errors=@discussion.errors.full_messages
      flash[:errors]=errors

      return redirect_to group_path
   end

   private
      def discussion_params
         params.require(:discussion).permit(:content).merge(user: current_user).merge(group: @group)
      end



end

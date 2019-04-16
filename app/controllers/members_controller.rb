class MembersController < ApplicationController

   def join_group
      @group=Group.find(params[:id])

      Member.create(user: current_user, group: @group)

      return redirect_to group_path
   end

   def leave_group
      @group=Group.find(params[:id])

      Member.find_by(group: @group, user: current_user).delete

      return redirect_to group_path
   end

end

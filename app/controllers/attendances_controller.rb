class AttendancesController < ApplicationController

   def join_event
      @event=Event.find(params[:id])

      Attendance.create(user: current_user, event: @event)

      return redirect_to event_path
   end

   def leave_event
      @event=Event.find(params[:id])

      Attendance.find_by(event: @event, user: current_user).delete

      return redirect_to event_path
   end

end

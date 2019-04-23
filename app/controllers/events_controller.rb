class EventsController < ApplicationController

   def show
      @event=Event.find(params[:id])
      # @event_group=Group.find(@event.group.id)
      @comments=Comment.where(event: @event).all
   end

   def new_event
      @group=Group.find(params[:id])

   end

   def create_event
      @location=Location.existsOrCreate(params[:location][:city], params[:location][:state])
      @group=Group.find(params[:id])

      @event=Event.new(event_params)


      if @event.save && @location.valid?
         flash[:notice]=["New Event Created."]

         return redirect_to users_path
      end


      errors=@event.errors.full_messages+@location.errors.full_messages

      flash[:errors]=errors

      return redirect_to ("/events/new/"+(@group.id).to_s)
   end


   private
      def event_params
         params.require(:event).permit(:name, :date, :time, :description, :addressLine1, :addressLine2).merge(group: @group).merge(location: @location)
      end


end

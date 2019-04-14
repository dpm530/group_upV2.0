class EventsController < ApplicationController

   def new_event
   end

   def create
      @location=Location.existsOrCreate(params[:location][:city], params[:location][:state])

      @group=Group.find(params[:id])

      @event=Event.new(event_params)


      if @event.save && @location.valid?
         flash[:notice]=["New Event Created."]

         return redirect_to users_path
      end

      errors=@event.errors.full_messages+@location.errors.full_messages

      flash[:errors]=errors

      return redirect_to new_event_path
   end

   private
      def event_params
         params.require(:event).permit(:name, :date, :time, :description, :addressLine1, :addressLine2).merge(group: @group ).merge(location: @location)
      end


end

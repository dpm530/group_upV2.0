class EventsController < ApplicationController
   before_action :require_user_login

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

   def edit
      @event=Event.find(params[:id])
   end

   def update
      @event=Event.find(params[:id])
      @location=Location.existsOrCreate(params[:location][:city], params[:location][:state])

      if @location.valid?
         if @event.update(update_event_params)
            flash[:notice]=["Updated Event"]

            return redirect_to event_path(@event)
         end
      end

      errors=@event.errors.full_messages + @location.errors.full_messages

      flash[:errors]=errors
      return redirect_to edit_event_path
   end

   def destroy
      @event=Event.find(params[:id])
      @group=@event.group

      if @event.destroy
         flash[:notice]=["Event Deleted"]
         return redirect_to group_path(@group)
      end
   end


   private
      def event_params
         params.require(:event).permit(:name, :date, :time, :description, :addressLine1, :addressLine2).merge(group: @group).merge(location: @location)
      end

      def update_event_params
         params.require(:event).permit(:name, :date, :time, :description, :addressLine1, :addressLine2).merge(location: @location)
      end


end

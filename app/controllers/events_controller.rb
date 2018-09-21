class EventsController < ApplicationController

  before_action :set_event, only: [:show, :edit, :update, :destroy]

  def index
    @events = Event.all
    # @events = current_user.events.order(:name)
    @events = Event.order(created_at: :asc)
    respond_to do |f|
      f.html
      f.json {render json: @events}
    end
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @event.user = current_user
    if @event && @event.save
      respond_to do |f|
        f.html {redirect_to event_path(@event), flash: {success: "'#{@event.name}' was added!"}}
        # f.html {redirect_to event_path(@event), flash: {success: "'#{@event.first_name} #{@event.last_name}' was added!"}}
        f.json {render json: @event}
      end
    else
      render :new, flash: {danger: "Please enter all fields"}
    end
  end

  def show
    @artwork = @event.artworks
    respond_to do |f|
      f.html
      f.json { render json: @event }
    end
  end

  def edit
  end

  def update
    if @event.update(event_params)
      respond_to do |f|
        f.html {redirect_to event_path(@event), flash: {success: "'#{@event.name}' was updated!"}}
        # f.html {redirect_to event_path(@event), flash: {success: "'#{@event.first_name} #{@event.last_name}' was updated!"}}
        f.json {render json: @event}
      end
    else
      render :edit
    end
  end

  def destroy
    @event.delete
    respond_to do |f|
      f.html { redirect_to events_path, flash: {success: "'#{@event.name}' was deleted!"} }
      f.json { head :no_content }
    end
  end

  private

    def set_event
      @event = Event.find(params[:id])
    end

    def event_params
      params.require(:event).permit(:name, :website, :discovered, :rating, :notes)
    end

end

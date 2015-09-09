class EventsController < ApplicationController
  before_filter :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_filter :set_host, except: :index
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  before_filter :set_user

  # GET /events
  # GET /events.json
  def index
    @events = Event.all
  end

  # GET /events/1
  # GET /events/1.json
  def show
  end

  # GET /events/new
  def new
    @event = @host.events.new
  end

  # GET /events/1/edit
  def edit
  end

  # POST /events
  # POST /events.json
  def create
    @event = @host.events.new(event_params)

    respond_to do |format|
      if @event.save
        format.html { redirect_to profile_path(current_user.username), notice: 'Event was successfully created.' }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url, notice: 'Event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def url_options
    { username: params[:username] }.merge(super)
  end
  private
    def set_host
      if signed_in? && current_user.username == params[:username]
        @host = current_user.hosts.find(params[:host_id])
      else
        @host = @user.hosts.find(params[:host_id])
      end
    end

    def set_user
      @user = User.find_by_username(params[:username])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = @host.events.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.require(:event).permit(:event_title,:user_id, :host_id, :starts_at, :time_zone,:event_avatar)
    end
end

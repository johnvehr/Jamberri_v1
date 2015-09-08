class HostsController < ApplicationController
  before_filter :authenticate_user!, only: [:new, :create, :edit, :update]
  before_filter :find_user
  before_action :set_host, only: [:show, :edit, :update, :destroy]

  def index
    @hosts = Host.all
  end

  def show
  end

  def new
    @host = current_user.hosts.new
  end

  def edit
  end

  def create
    @host = current_user.hosts.new(host_params)

    respond_to do |format|
      if @host.save
        format.html { redirect_to profile_path(current_user.username), notice: 'Host was successfully created.' }
        format.json { render json: @host, status: :created, location: @host }
      else
        format.html { render :new }
        format.json { render json: @host.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @host.update(host_params)
        format.html { redirect_to @host, notice: 'Host was successfully updated.' }
        format.json { render :show, status: :ok, location: @host }
      else
        format.html { render :edit }
        format.json { render json: @host.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @host.destroy
    respond_to do |format|
      format.html { redirect_to hosts_url, notice: 'Host was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def find_user
      @user = User.find_by_username(params[:username])
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_host
      @host = Host.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def host_params
      params.require(:host).permit(:host_title, :host_bio, :user_id, :host_avatar)
    end
end

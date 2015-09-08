class ProfilesController < ApplicationController
  def show
    @user = User.find_by_username(params[:id])
    @hosts = @user.hosts.all
    @events = Event.all
  end
end

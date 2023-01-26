class DashboardController < ApplicationController
  def index
    authorize :dashboard, :index?
    @active_users = Profile.all.length
    @genres_count = Genre.all.length
    @artists_count = Artist.all.length
  end
end

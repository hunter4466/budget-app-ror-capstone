class SplashController < ApplicationController
  skip_before_action :authenticate_user!
  def show
    redirect_to groups_show_url if current_user
  end
end

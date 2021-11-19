class SplashController < ApplicationController
    skip_before_action :authenticate_user!
    def show
        if current_user
            redirect_to groups_show_url()
        end
    end
end
  
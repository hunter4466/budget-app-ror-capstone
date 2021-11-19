class GroupsController < ApplicationController
    def show
        @categories = Group.where(user_id: current_user.id)
    end
  
    def new
    end
end
  
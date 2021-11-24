class GroupsController < ApplicationController
  def show
    @categories = Group.where(user_id: current_user.id)
  end

  def new
    @cat_id = params[:cat_id]
    @group = Group.new
  end

  def create
    @group = Group.new
    @group.name = params[:group][:name]
    @group.icon = params[:group][:iconurl]
    @group.user_id = current_user.id
    if @group.save
      redirect_to groups_show_url
      flash.now[:notice] = 'Category successfully created'
    else
      flash.now[:error] = 'Category could not be created'
      render :new
    end
  end
end

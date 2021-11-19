class EntitiesController < ApplicationController
    def show
        @cat_id = params[:cat_id]
        @group_entities = GroupEntity.where(group_id: params[:cat_id]).order(:created_at)
        @entities = []
        @group_entities.each do |e|
            @entities << Entity.where(id: e.entity_id)
        end
    end

    def new
        @prev_data = params[:prev_data]
        @prev_data_two = params[:prev_data_two]
        @categories = Group.where(user_id: current_user.id)
        @entity = Entity.new
    end

    def create
        @categories = Group.where(user_id: current_user.id)
        p 'did this'
        count = 0
        @categories.each do |e|
            if params[:entity][e.name.parameterize.underscore.to_sym].to_i > 0
                count += 1
            end
        end
        if count == 0
            p 'didnt pass the test'
            flash.now[:error] = 'Record could not be created'
            redirect_to entities_new_url(prev_data: params[:entity][:name], prev_data_two: params[:entity][:amount])
        else
            @entity = Entity.new
            @entity.name = params[:entity][:name]
            @entity.amount = params[:entity][:amount]
            @entity.user_id = current_user.id
            @entity.save
            @categories.each do |e|
                if params[:entity][e.name.parameterize.underscore.to_sym].to_i > 0
                    @group_entity = GroupEntity.new
                    @group_entity.group_id = e.id
                    @group_entity.entity_id = @entity.id
                    @group_entity.save
                end
            end
        end
    end
end

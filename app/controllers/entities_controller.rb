class EntitiesController < ApplicationController
    def show
        @cat_id = params[:cat_id]
        @group_entities = GroupEntity.where(group_id: params[:cat_id]).order(:created_at)
        @entities = []
        sum = 0
        @group_entities.each do |e|
            @entities << Entity.where(id: e.entity_id)
            sum += Entity.where(id: e.entity_id)[0].amount.to_f
        end
        @sumatory = sum
    end

    def new
        @categoryid = params[:prev_data_three]
        @prev_data = params[:prev_data]
        @prev_data_two = params[:prev_data_two]
        @categories = Group.where(user_id: current_user.id)
        @entity = Entity.new
    end

    def create
        @categories = Group.where(user_id: current_user.id)
        count = 0
        matcher = 0
        gruopidtosend = false
        @categories.each do |e|
            if params[:entity][e.name.parameterize.underscore.to_sym].to_i > 0
                count += 1
                if matcher == 0
                    gruopidtosend = e.id
                end
            end
        end
        if count == 0
            redirect_to entities_new_url(prev_data: params[:entity][:name], prev_data_two: params[:entity][:amount])
            flash.now[:error] = 'Record could not be created'
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
            redirect_to entities_show_url(cat_id: gruopidtosend)
            flash.now[:notice] = 'Transaction has been succesfully saved'
        end
    end
end

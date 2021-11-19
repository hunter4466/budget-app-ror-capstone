class EntitiesController < ApplicationController
    def show
        @group_entities = GroupEntity.where(group_id: params[:cat_id])
        @entities = []
        @group_entities.each do |e|
            @entities << Entity.where(id: e.entity_id)
        end
        p 'entities'
        p @entities
    end

    def new
    end
end

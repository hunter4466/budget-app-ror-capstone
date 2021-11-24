class AddEntityRefToGroupEntity < ActiveRecord::Migration[6.1]
  def change
    add_reference :group_entities, :entity, null: false, foreign_key: true
  end
end

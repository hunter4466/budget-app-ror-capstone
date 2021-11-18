class CreateGroupEntity < ActiveRecord::Migration[6.1]
  def change
    create_table :group_entities do |t|

      t.timestamps
    end
  end
end

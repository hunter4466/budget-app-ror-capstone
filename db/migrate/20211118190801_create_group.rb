class CreateGroup < ActiveRecord::Migration[6.1]
  def change
    create_table :groups do |t|
      t.string :name
      t.string :icon, default: "https://lorempixel.com/200/200/food/"
      t.timestamps
    end
  end
end

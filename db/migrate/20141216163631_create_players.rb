class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :name
      t.boolean :turn
      t.integer :order

      t.timestamps
    end
  end
end

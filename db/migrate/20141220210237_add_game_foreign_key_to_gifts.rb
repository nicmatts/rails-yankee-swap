class AddGameForeignKeyToGifts < ActiveRecord::Migration
  def change
    add_column :gifts, :game_id, :integer
  end
end

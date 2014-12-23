class AddDescriptionToGift < ActiveRecord::Migration
  def change
    add_column :gifts, :description, :text
  end
end

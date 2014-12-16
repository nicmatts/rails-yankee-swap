class AddDefaultToGiftName < ActiveRecord::Migration
  def change
    change_column :gifts, :name, :string, :default => "none"
  end
end

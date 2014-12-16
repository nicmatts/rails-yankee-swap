class ChangeColumnName < ActiveRecord::Migration
  def up
    rename_column :players, :order, :turn_order 
  end

  def down
    rename_column :players, :turn_order, :order 
  end
end

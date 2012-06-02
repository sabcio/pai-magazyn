class AddStateToProduct < ActiveRecord::Migration
  def change
    add_column :products, :removed, :boolean
  end
end

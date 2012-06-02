class CreateOrders < ActiveRecord::Migration
  def change
    create_table(:orders) do |t|
      t.string :number
      t.text :comment
      t.string :state
    end
  end

end

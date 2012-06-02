class CreateLineItems < ActiveRecord::Migration
  def change
    create_table(:line_items) do |t|
      t.integer :amount_needed
      t.integer :amount_given
      t.integer :order_id
      t.integer :product_id
    end
  end
end

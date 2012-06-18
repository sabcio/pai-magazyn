class OrderObserver < ActiveRecord::Observer
  observe :order

  def after_update(order)
    if order.state_changed? && order.processed?
      order.products.each(&:add_to_stock)
    end
  end
end
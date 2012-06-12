xml.instruct!
xml.orders do
  @orders.each do |order|
    xml.order do
      xml.number order.number
      xml.state order.state
      xml.id order.id
      xml.products do
        order.products.each do |item|
          xml.product do
            xml.id item.id
            xml.product_number item.product.product_number
            xml.order_id item.order_id
            xml.amount_needed item.amount_needed
            xml.amount_given item.amount_given
          end
        end
      end
    end
  end
end
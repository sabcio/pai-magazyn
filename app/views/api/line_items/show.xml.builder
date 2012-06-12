xml.instruct!

xml.product do
  xml.id @item.id
  xml.product_number @item.product.product_number
  xml.order_id @item.order_id
  xml.amount_needed @item.amount_needed
  xml.amount_given @item.amount_given
end



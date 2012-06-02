module ApplicationHelper

  def product_photo(product)
    image_tag(product.photo_url, :size => "128x128")
  end

end

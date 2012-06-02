module ApplicationHelper

  def product_photo(product, size = "128x128")
    image_tag(product.photo_url, :size => size)
  end

end

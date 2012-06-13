module ApplicationHelper

  def product_photo(product, size = "128x128")
    image_tag(product.photo_url, :size => size) if product.photo_url.present?
  end

  def severity_alert_class(severity)
    case severity
    when :alert then "error"
    when :notice then "success"
    end
  end

end

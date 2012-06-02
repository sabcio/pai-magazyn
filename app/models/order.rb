class Order < ActiveRecord::Base

  has_many :line_items, dependent: :destroy
  accepts_nested_attributes_for :line_items

  after_create :set_number

  def set_number
    time = Time.zone.now
    update_attribute(:number, [id, time.month, time.year].join("/"))
  end

  def total_items
    line_items.count
  end

end
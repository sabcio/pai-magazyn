class Order < ActiveRecord::Base

  has_many :line_items, dependent: :destroy

  after_create :set_number

  def set_number
    time = Time.zone.now
    update_attribute(:number, [id, time.month, time.year].join("/"))
  end

end
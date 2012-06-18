class Order < ActiveRecord::Base

  has_many :products, dependent: :destroy, class_name: "LineItem"
  accepts_nested_attributes_for :products, allow_destroy: true

  after_create :set_number

  scope :not_closed, where("state != ?", "closed")
  scope :ordered, order("id DESC")

  def set_number
    time = Time.zone.now
    update_attribute(:number, [id, time.month, time.year].join("/"))
  end

  def total_items
    products.count
  end


  state_machine :state, :initial => :new do
    event :activate do
      transition new: :open
    end

    event :process do
      transition open: :processed
    end

    event :close do
      transition processed: :closed
    end
  end

end
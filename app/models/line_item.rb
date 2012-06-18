class LineItem < ActiveRecord::Base

  belongs_to :order
  belongs_to :product

  validates :order_id, presence: true, on: :update
  validates :product_id, presence: true
  validates :amount_needed, presence: true,
                            numericality: { :only_integer => true }
  validates :amount_given, numericality: { :only_integer => true },
                          allow_blank: true

  before_create :set_amount_given

  def set_amount_given
    self.amount_given = 0
  end

  def add_to_stock
    product.transaction do
      product.update_attribute(:stock, product.stock + amount_given) if amount_given
    end
  end

end
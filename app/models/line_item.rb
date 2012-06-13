class LineItem < ActiveRecord::Base

  belongs_to :order
  belongs_to :product

  validates :order_id, presence: true, on: :update
  validates :product_id, presence: true
  validates :amount_needed, presence: true,
                            numericality: { :only_integer => true }
  validates :amount_given, numericality: { :only_integer => true },
                          allow_blank: true

end
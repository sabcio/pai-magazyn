class LineItem < ActiveRecord::Base

  belongs_to :order
  belongs_to :product

  validate :amount_needed, presence: true,
                           numericality: { :only_integer => true }

end
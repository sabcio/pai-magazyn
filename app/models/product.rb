class Product < ActiveRecord::Base
  attr_accessible :name, :product_number, :photo_url, :price, :stock, :description, :removed

  validates :product_number, uniqueness: true,
                            numericality: {only_integer: true},
                            presence: true
  validates :photo_url, format: {with: URI::regexp(%w(http https))}
  validates :name, presence: true
  validates :price, presence: true, numericality: true
  validates :stock, presence: true, numericality: {only_integer: true}


end

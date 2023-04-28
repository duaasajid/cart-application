class LineItem < ApplicationRecord
  belongs_to :product
  belongs_to :cart

  accepts_nested_attributes_for :cart


  validates :quantity, numericality: { greater_than: 0 }
  validates :total_price, numericality: { greater_than_or_equal_to: 0 }

  before_validation :set_total_price

  def set_total_price
    self.total_price = quantity * product.price
  end

end

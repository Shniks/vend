class Snack < ApplicationRecord
  validates_presence_of :name, :price
  has_many :machinesnacks
  has_many :machines, through: :machinesnacks


  def price_of_snack
    (price.to_f / 100).round(2)
  end
end

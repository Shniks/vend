class Machine < ApplicationRecord
  belongs_to :owner
  has_many :machinesnacks
  has_many :snacks, through: :machinesnacks

  def average_price_of_snacks
    (snacks.average(:price) / 100).round(2)
  end
end

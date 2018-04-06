class Snack < ApplicationRecord
  validates_presence_of :name, :price
  has_many :machinesnacks
  has_many :machines, through: :machinesnacks
end

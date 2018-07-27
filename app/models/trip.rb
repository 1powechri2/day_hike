class Trip < ApplicationRecord
  has_many :triptrails
  has_many :trails, through: :triptrails
end

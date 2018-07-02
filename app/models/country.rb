class Country < ApplicationRecord

  has_many :travel_destinations
  has_many :quotes, through: :travel_destinations
  has_many :policies, through: :travel_destinations

  belongs_to :destination_class

  def to_s
    name
  end

end

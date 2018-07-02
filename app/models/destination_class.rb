class DestinationClass < ApplicationRecord

  has_many :quotes
  # has_many :policies
  has_many :countries

  def to_s
    name
  end

end

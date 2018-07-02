class TravelDestination < ApplicationRecord
  belongs_to :quote
  belongs_to :country
end

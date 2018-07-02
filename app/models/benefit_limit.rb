class BenefitLimit < ApplicationRecord
  belongs_to :destination_class
  belongs_to :benefit_category
  belongs_to :benefit
end

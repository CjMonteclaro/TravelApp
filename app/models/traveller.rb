class Traveller < ApplicationRecord

  belongs_to :quote
  belongs_to :travel_prem, optional: true

  has_one :policy

  before_save :compute_age, :find_premium_band

  validates_presence_of :first_name, :birthdate

  def compute_age
    now = Time.now.utc.to_date
    dob = self.birthdate

    self.age = now.year - dob.year - ((now.month > dob.month || (now.month == dob.month && now.day >= dob.day)) ? 0 : 1)

    # reference - https://stackoverflow.com/questions/819263/get-persons-age-in-ruby
  end

  def find_premium_band
    self.travel_prem_id = self.quote.travel_prem_id

    premium_band = TravelPrem.find(self.travel_prem_id)

    self.base_prem = premium_band.premium/1.0295
    self.total_charges = self.base_prem * 0.0295
    self.gross_prem = premium_band.premium
  end

  def full_name
    "#{first_name} #{last_name}"
  end

end

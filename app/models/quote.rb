class Quote < ApplicationRecord

  belongs_to :user, optional: true
  belongs_to :destination_class, optional: true
  belongs_to :traveller_type, optional: true
  belongs_to :travel_prem, optional: true

  has_many :travel_destinations, dependent: :destroy
  accepts_nested_attributes_for :travel_destinations, allow_destroy: true, reject_if: proc { |attributes| attributes[:country_code].blank?  }

  has_many :countries, through: :travel_destinations

  has_many :travellers, dependent: :destroy
  accepts_nested_attributes_for :travellers, allow_destroy: true, reject_if: proc { |attributes| attributes[:_destroy] == 1 }

  has_many :policies

  validates_presence_of :travellers_count, :start_date, :end_date

  before_save :compute_travel_duration, :find_premium_band

  def self.find_destination_class(country_ids)
    destination_class_id = Country.where(id: country_ids.reject { |c| c.empty? }).order('destination_class_id DESC').first.destination_class_id
  end


  def compute_travel_duration
    if self.destination_class_id == 2
      self.schengen_end_date = self.end_date + 15.days
      self.duration = (self.schengen_end_date - self.start_date).to_i + 1
    else
      self.duration = (self.end_date - self.start_date).to_i + 1
    end
  end

  def find_premium_band
    period = TravelPeriod.where('days >= :duration', duration: self.duration).first
    premium_band = TravelPrem.where(destination_class_id: self.destination_class_id, travel_period_id: period.id).first

    self.travel_prem_id = premium_band.id
  end

  def compute_total_due
    if travellers.present?
      update(travellers_count: self.travellers.count, base_prem: travellers.collect(&:base_prem).sum, total_charges: travellers.collect(&:total_charges).sum, gross_prem: travellers.collect(&:gross_prem).sum)
    else
      update(gross_prem: self.travel_prem.premium * self.travellers_count)
    end
  end

  #********  PayMaya Checkout Requirements ********

  def checkout_total_amount
    {
      currency: 'PHP',
      value: gross_prem * 100
    }
  end

  def checkout_buyer(current_user)
    {
      first_name: current_user.profile.first_name,
      middle_name: current_user.profile.middle_name,
      last_name: current_user.profile.last_name,
      contact: { phone: current_user.profile.phone, email: current_user.email },
      billing_address: {
        line1: current_user.profile.address1,
        line2: current_user.profile.address2,
        city: current_user.profile.city_id,
        state: current_user.profile.province_id,
        zip_code: current_user.profile.zip_code,
        country_code: 'PH'
        },
      ip_address: current_user.current_sign_in_ip
    }
  end

  def checkout_items
    items = []

    self.travellers.each do |traveller|
      item = {
        name: traveller.full_name,
        code: "#{destination_class.name.upcase}-#{self.duration}D-#{self.travel_prem_id}",
        quantity: 1,
        description: "#{self.countries.collect(&:name).unshift('Philippines').push('Philippines').join(' - ')}",
        total_amount: { value: traveller.gross_prem * 100 }
        }
      items << item
    end

    items
  end



end

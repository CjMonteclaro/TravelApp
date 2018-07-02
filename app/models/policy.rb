class Policy < ApplicationRecord

  belongs_to :user
  belongs_to :quote, counter_cache: true
  belongs_to :traveller
  before_save :create_online_policy_number

  def create_online_policy_number
    self.online_policy_no = ("PHL" + quote.destination_class.name[0] + Time.now.strftime('%Y-%m%d%H%M-%S').to_s + self.id.to_s)
  end

end

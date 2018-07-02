class TravelPrem < ApplicationRecord

  belongs_to :destination_class
  belongs_to :travel_period

  has_many :quotes

  def self.import(file)
    spreadsheet = Roo::Spreadsheet.open(file)
    header = spreadsheet.row(1)
    (2..spreadsheet.last_row).each do |i|
      self.find_or_create_by(
        destination_class_id: spreadsheet.cell(i,'A').to_i,
        travel_period_id: spreadsheet.cell(i,'B').to_i,
        premium: spreadsheet.cell(i,'C'),
        prem_type: "Gross",
        from: Date.today
      )
    end
  end

end

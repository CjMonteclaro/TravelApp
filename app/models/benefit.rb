class Benefit < ApplicationRecord

  belongs_to :benefit_category
  has_many :benefit_limits

  def self.import(file)
    spreadsheet = Roo::Spreadsheet.open(file)
    (1..spreadsheet.last_row).each do |i|
      @benefit = self.find_or_create_by(
        benefit_category_id: spreadsheet.cell(i,'A').to_i,
        name: spreadsheet.cell(i,'B').to_s,
        from: Date.today
      )

      [1,2,3].each do |destination_class|
        @benefit_limit = @benefit.benefit_limits.build(
          destination_class_id: destination_class,
          benefit_category_id: spreadsheet.cell(i,'A').to_i,
          currency: spreadsheet.cell(i,'C').to_s,
          limit: (destination_class == 1) ? spreadsheet.cell(i,'D') : spreadsheet.cell(i,'E'),
          remarks: spreadsheet.cell(i,'F'),
          from: Date.today
        )
        @benefit.benefit_limits << @benefit_limit
      end
    end
  end

end

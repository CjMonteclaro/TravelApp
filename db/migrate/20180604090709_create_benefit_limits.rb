class CreateBenefitLimits < ActiveRecord::Migration[5.1]
  def change
    create_table :benefit_limits do |t|
      t.references :destination_class, foreign_key: true
      t.references :benefit_category, foreign_key: true
      t.references :benefit, foreign_key: true
      t.string :currency
      t.decimal :limit, precision: 10, scale: 2
      t.string :remarks
      t.date :from
      t.date :to

      t.timestamps
    end
  end
end

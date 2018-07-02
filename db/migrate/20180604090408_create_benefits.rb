class CreateBenefits < ActiveRecord::Migration[5.1]
  def change
    create_table :benefits do |t|
      t.references :benefit_category, foreign_key: true
      t.string :name
      t.text :description
      t.date :from
      t.date :to

      t.timestamps
    end
  end
end

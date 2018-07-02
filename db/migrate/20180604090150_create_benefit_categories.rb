class CreateBenefitCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :benefit_categories do |t|
      t.string :name
      t.date :from
      t.date :to

      t.timestamps
    end
  end
end

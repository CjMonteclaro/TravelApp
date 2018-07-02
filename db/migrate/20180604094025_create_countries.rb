class CreateCountries < ActiveRecord::Migration[5.1]
  def change
    create_table :countries do |t|
      t.string :name
      t.string :shortname
      t.string :shortname2
      t.string :capital
      t.string :region
      t.string :subregion
      t.references :destination_class, foreign_key: true

      t.timestamps
    end
  end
end

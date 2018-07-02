class CreateTravelDestinations < ActiveRecord::Migration[5.1]
  def change
    create_table :travel_destinations do |t|
      t.references :quote, foreign_key: true
      t.references :country, foreign_key: true
      t.integer :policy_id

      t.timestamps
    end
  end
end

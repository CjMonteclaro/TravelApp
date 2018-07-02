class CreateTravelPeriods < ActiveRecord::Migration[5.1]
  def change
    create_table :travel_periods do |t|
      t.integer :days

      t.timestamps
    end
  end
end

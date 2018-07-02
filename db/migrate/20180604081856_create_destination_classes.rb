class CreateDestinationClasses < ActiveRecord::Migration[5.1]
  def change
    create_table :destination_classes do |t|
      t.string :name

      t.timestamps
    end
  end
end

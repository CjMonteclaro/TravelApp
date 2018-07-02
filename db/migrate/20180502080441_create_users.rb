class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :username
      t.string :email
      t.boolean :enabled
      t.boolean :email_opt_in
      t.boolean :privacy_opt_in
      t.datetime :tos_agreed
      t.integer :policies_count
    end
  end
end

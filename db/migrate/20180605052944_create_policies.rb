class CreatePolicies < ActiveRecord::Migration[5.1]
  def change
    create_table :policies do |t|
      t.references :user, foreign_key: true
      t.references :quote, foreign_key: true
      t.references :traveller, foreign_key: true
      t.string :payment_via
      t.string :online_policy_no
      t.integer :genweb_policy_id
      t.string :genweb_policy_no
      t.integer :genweb_bill_no
      t.string :genweb_receipt_no

      t.timestamps
    end
  end
end

class CreateReferrals < ActiveRecord::Migration[7.0]
  def change
    create_table :referrals do |t|
      t.string :email, null: false
      t.integer :status, null: false, default: 0
      t.integer :resend_count, null: false, default: 0
      t.string :uuid, null: false, index: { unique: true }
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end

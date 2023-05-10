class AddUniquenessEmailAndUserToReferral < ActiveRecord::Migration[7.0]
  def change
    add_index :referrals, [:email, :user_id], unique: true, name: 'uniq_email_per_user'
  end
end

class AddReferralReferenceToUser < ActiveRecord::Migration[7.0]
  def change
    add_reference :users, :referral, index: true
  end
end

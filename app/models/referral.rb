class Referral < ApplicationRecord

  belongs_to :user

  enum status: { pending: 0, accepted: 1}

  validates :email, uniqueness: { scope: :user_id }, presence: true
  validates :uuid, presence: true, uniqueness: true
end

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  belongs_to :referral, class_name: 'User', foreign_key: 'referral_id', optional: true
  has_many :referrals, dependent: :destroy

  enum role: { direct: 0, admin: 1, referral: 2 }

  validates :first_name, :last_name, presence: true
end

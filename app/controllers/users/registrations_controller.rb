class Users::RegistrationsController < Devise::RegistrationsController
  before_action :get_referral_id, only: [:create]
  after_action :update_role_referral_id, only: [:create]

  private

    def update_role_referral_id
      if get_referral_id.present?
        current_user.update(role: :referral, referral_id: @referral)
        @referral.update(status: :accepted)
      end
    end

    def get_referral_id
      @referral = Referral.find_by(uuid: params["user"]["uuid"]).user_id if params["user"]["uuid"].present?
    end
end
class ReferralsController < ApplicationController
  before_action :set_referral, only: [:resend_referral]
  before_action :verify_email_already_present?, only: [:create]

  def new
    authorize Referral
  end

  def create
    authorize Referral

    @referral = policy_scope(Referral).new(referral_params)
    respond_to do |format|
      if !verify_email_already_present? && @referral.save
        send_referral_invitation(@referral.email, @referral.uuid, @referral.user.first_name)
        flash[:notice] = 'Referral was created successfully'
        flash.keep(:notice)
        format.html { redirect_to root_path }
        format.json { render json: @referral, status: :ok }
      else
        format.html { redirect_to root_path, alert: @referral.errors.full_messages.to_sentence }
        format.json { render json: @referral.errors, status: :unprocessable_entity }
      end
    end
  end

  def resend_referral
    authorize @referral

    respond_to do |format|
      if @referral.resend_count <= 4 && @referral.update(resend_count: (@referral.resend_count + 1))
        send_referral_invitation(@referral.email, @referral.uuid, @referral.user.first_name)
        flash[:notice] = 'Referral was Resend successfully'
        flash.keep(:notice)
        format.html { redirect_to root_path }
        format.json { render json: @referral, status: :ok }
      else
        format.html { redirect_to root_path, alert: @referral.errors.full_messages.to_sentence }
        format.json { render json: @referral.errors, status: :unprocessable_entity }
      end
    end
  end

  private

    def set_referral
      @referral = Referral.find(params[:id])
    end

    def referral_params
      params.require(:referral).permit(:email).with_defaults(user: current_user, uuid: SecureRandom.uuid)
    end

    def send_referral_invitation(email, uuid, first_name)
      ReferralServices::SendReferralEmail.new(email, uuid, first_name).process
    end

    def verify_email_already_present?
      User.find_by(email: params[:referral][:email]).present?
    end
end

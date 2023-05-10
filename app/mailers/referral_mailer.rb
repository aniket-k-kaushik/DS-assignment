class ReferralMailer < ApplicationMailer
  def send_email(email, uuid, from_first_name)
    @email = email
    @from_first_name = from_first_name
    @url  = "http://localhost:3000/users/sign_up?referral_uuid=#{uuid}"
    mail(to: @email, subject: "Hi! Your friend #{from_first_name} invited to SignUp at DS-Assignment App")
  end
end

# Preview all emails at http://localhost:3000/rails/mailers/referral_mailer
class ReferralMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/referral_mailer/send_email
  def send_email
    ReferralMailer.send_email
  end

end

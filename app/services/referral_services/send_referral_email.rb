module ReferralServices
  class SendReferralEmail

    attr_accessor :email, :uuid, :from_first_name
    def initialize(email, uuid, from_first_name)
      @email = email
      @uuid = uuid
      @from_first_name = from_first_name
    end

    def process
      send_email
    end

    private

      def send_email
        begin
          ReferralMailer.send_email(email, uuid, from_first_name).deliver_now
        rescue StandardError => e
          logger.error "Error sending referral email: #{e.message}"
          flash[:alert] = "Failed to send referral email, please try again later."
        end
      end
  end
end
class ReferralPolicy < ApplicationPolicy
  class Scope < Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end
  end

  def new?
    is_user_admin?
  end

  def create?
    is_user_admin?
  end

  def resend_referral?
    user.id == record.user_id && is_user_admin?
  end

  def can_access?
    is_user_admin?
  end
end
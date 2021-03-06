class UserRegistration
  attr_accessor :user

  def initialize(user)
    @user = user
  end

  def register_user(stripe_token)
    if user.valid?
      response = StripeWrapper::Customer.create(
        :card => stripe_token,
        :email => user.email)
      if response.successful?
        user.stripe_id = response.customer_id
        if user.save
          AppMailer.delay.welcome_email(user)
          invitation = Invitation.where(friend_email: user.email).first
          handle_invitation(invitation) if invitation
          UserRegistrationResult.new(true, false, nil)
        else
          UserRegistrationResult.new(false, true, nil)
        end
      else
        UserRegistrationResult.new(false, false, response.error_message)
      end
    else
      UserRegistrationResult.new(false, true, nil)
    end
  end

  private

  def handle_invitation(invitation)
    user.follow! invitation.user
    invitation.user.follow! user
    invitation.update_attribute(:token, nil)
  end

  class UserRegistrationResult < Struct.new(:successful, :invalid_user, :stripe_error_message)
    def invalid_user?
      self[:invalid_user]
    end

    def successful?
      self[:successful]
    end
  end
end
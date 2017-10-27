class ConfirmEmailSignUpJob < ApplicationJob
  queue_as :default

  def perform(auth)
    Timeout.timeout(60) do
      UserMailer.email_sign_up(auth).deliver_now
    end
  end
end

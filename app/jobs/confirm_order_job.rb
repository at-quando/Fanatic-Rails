class ConfirmOrderJob < ApplicationJob
  queue_as :default

  def perform(auth, list_orderItem)
    UserMailer.email_order(auth, list_orderItem).deliver_now
  end
end

class UserMailer < ApplicationMailer
  def email_sign_up(auth)
    @auth = auth
    @url = 'http://0.0.0.0:4200/confirm_email/'
    @url = @url + @auth.confirm_token + '/' + @auth.uid + '/' + @auth.provider
    mail(to: @auth.uid, subject: 'VERIFY YOUR ACCOUNT IN FANATIC WEBSITE!')
  end

  def email_order(auth, list_orderItem)
    @list_orderItem = list_orderItem
    @total = 0
    @list_orderItem.each do |item|
      @total = @total + item.total
    end
    @auth = auth
    mail(to: @auth.uid, subject: 'CONFIRM YOUR ORDER IN FANATIC WEBSITE!')
  end
end

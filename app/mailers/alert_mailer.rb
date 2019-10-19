# frozen_string_literal: true

class AlertMailer < ApplicationMailer
  def alert_mail(user, estimate_amount, sum_price)
    @user = user
    @estimate_amount = estimate_amount
    @sum_price = sum_price

    mail to: @user.email, subject: '今月の設定金額が近づいています。'
  end
end

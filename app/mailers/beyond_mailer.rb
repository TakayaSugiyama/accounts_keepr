class BeyondMailer < ApplicationMailer
  def beyond_mail(user, estimate_amount, sum_price)
    @user = user
    @estimate_amount = estimate_amount
    @sum_price = sum_price

    mail to: @user.email , subject: "今月の設定金額を超えました。"
  end
end

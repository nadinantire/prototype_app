class ContactMailer < ApplicationMailer
  default from: "from@example.com"
  def contact_mail(purchase)
    @purchase = purchase
    mail to: @purchase.user.email, subject: "更新確認メール"
  end
end

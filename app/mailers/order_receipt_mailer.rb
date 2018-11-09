class OrderReceiptMailer < ApplicationMailer

  default from: 'no-reply@jungle.com'

  def order_receipt_email(order)
  @order = order
  mail(to:@order.email, subject: "jungle:Order No. # {@order.id} Receipt")
  end
end

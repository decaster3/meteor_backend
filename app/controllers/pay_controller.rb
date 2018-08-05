class PayController < ApplicationController
  # before_action :authenticate_user!

  def epay
    # здесь вы фиксируете Order_ID, который вы передадите банку
    # и по которому вы сможете в дальнейшем найти нужный платеж
    # и пользователя, чтобы зачислить деньги ему на счет
    payment_request = Order.last

    order_id = payment_request.id
    amount = 10

    @base64_encoded_xml = KazkomEpay::Signer.new(amount: amount, order_id: order_id).base64_encoded_signed_xml
    # ...
    print(@base64_encoded_xml)
  end
  # ...
end
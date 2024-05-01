class PaymentsController < ApplicationController
  def buy_form
  end

  def create_payment_intent
     # Tokenize card information from frontend
    customer = StripePayment.create_customer(params)
    amount = 800
    payment_intent = StripePayment.process_payment(amount,customer)
    confirm_payment_intent = StripePayment.confirm_payment_intent(payment_intent)
    StripePayment.attach_payment_method_to_customer(customer.id, params[:payment_method_id])
  end

end

class StripePayment
    class << self
        def process_payment(amount,customer)
            payment_intent = Stripe::PaymentIntent.create({
            amount: amount,
            customer: customer.id,
            currency: 'INR',
            description: 'Rails Stripe customer',
        })
        end
        def confirm_payment_intent(payment_intent)
            payment_intent_id = payment_intent.id
            confirm_payment_intent = Stripe::PaymentIntent.retrieve(payment_intent_id)
        end
        def create_customer(options)
            token = options[:stripeToken]
            email = options[:stripeEmail]
            customer = Stripe::Customer.create({
                source: token,
                email: email, # You can pass additional customer information here
                description: "Customer for #{email}"
              })
        end
        def attach_payment_method_to_customer(customer_id,payment_method_id)
            customer = Stripe::Customer.retrieve(customer_id)
            # Attach the payment method to the customer
            Stripe::PaymentMethod.attach(payment_method_id, {
            customer: customer_id
            })
        end
    end  
end
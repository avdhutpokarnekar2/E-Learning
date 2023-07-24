# frozen_string_literal: true

class PaymentController < ApplicationController
  require 'stripe'
  Stripe.api_key = ENV['stripe_secret_key']

  def stripe_payment
    course = Course.find(params[:course_id])
    course_fee = course.fees * 100
    product = Stripe::Product.create({ name: 'Order 1' })
    @session = Stripe::Checkout::Session.create({ payment_method_types: ['card'],
                                                  line_items: [
                                                    price_data: {
                                                      product: product.id,
                                                      unit_amount: course_fee,
                                                      currency: 'inr'
                                                    },
                                                    quantity: 1
                                                  ],
                                                  mode: 'payment',
                                                  success_url: payment_success_url,
                                                  cancel_url: payment_cancel_url })
  end

  def success
    redirect_to root_url, notice: 'Purchase Successful'
  end

  def cancel
    redirect_to root_url, notice: 'Purchase Unsuccessful'
  end
end

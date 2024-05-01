
Rails.configuration.stripe = {
  publishable_key: 'pk_test_51MkO99SB79YqinrxOjaGgF804bWubRMJihg84YmoUF4l18TI3F91C81HFCf9Y8P43SKzOwXAacxXMH3pcwyFtpyd00BC7ELR1y',
  secret_key:'sk_test_51MkO99SB79YqinrxHZIJM6hyF3zHHGyMDho5f0zSlucjl8hciuw4Bh4h2SMhZTbQAqg5XuNizFi3Mrji0PD4xLJU003fcn8bkj'
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]

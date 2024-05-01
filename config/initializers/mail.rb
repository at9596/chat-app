ActionMailer::Base.smtp_settings = { 
      address:              'smtp.sendgrid.net',
      port:                 587,
      domain:               'localhost', 
      user_name:            'apikey', # Set your SendGrid username via environment variable
      password:             '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', # Set your SendGrid password via environment variable
      authentication:       :plain,
      enable_starttls_auto: true
    }


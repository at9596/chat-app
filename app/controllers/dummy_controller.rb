en:
  devise:
    confirmations:
      confirmed: "Your email address has been successfully confirmed."
      send_instructions: "You will receive an email with instructions for how to confirm your email address in a few minutes."
      send_paranoid_instructions: "If your email address exists in our database, you will receive an email with instructions for how to confirm your email address in a few minutes."
    failure:
      already_authenticated: "You are already signed in."
      inactive: "Your account is not activated yet."
      invalid: "Invalid %{authentication_keys} or password."
      locked: "Your account is locked."
      last_attempt: "You have one more attempt before your account is locked."
      not_found_in_database: "Invalid %{authentication_keys} or password."
      timeout: "Your session expired. Please sign in again to continue."
      unauthenticated: "You need to sign in or sign up before continuing."
      unconfirmed: "You have to confirm your email address before continuing."
    mailer:
      confirmation_instructions:
        subject: "Confirmation instructions"
      reset_password_instructions:
        subject: "Reset password instructions"
      unlock_instructions:
        subject: "Unlock instructions"
      email_changed:
        subject: "Email Changed"
      password_change:
        subject: "Password Changed"
    omniauth_callbacks:
      failure: "Could not authenticate you from %{kind} because \"%{reason}\"."
      success: "Successfully authenticated from %{kind} account."
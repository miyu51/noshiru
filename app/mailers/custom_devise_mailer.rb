class CustomDeviseMailer < Devise::Mailer
  def confirmation_instructions(record, token, opts = {})
    email = super
    send_via_gmail_api(email)
    email
  end

  def email_changed(record, token, opts = {})
    email = super
    send_via_gmail_api(email)
    email
  end

  def password_changed(record, token, opts = {})
    email = super
    send_via_gmail_api(email)
    email
  end

  def reset_password_instructions(record, token, opts = {})
    email = super
    send_via_gmail_api(email)
    email
  end

  private

  def send_via_gmail_api(email)
    GmailSender.new.send_email(
      to: email.to.first,
      subject: email.subject,
      body: email.body.raw_source
    )
  rescue => e
    Rails.logger.error "Gmail API送信エラー: #{e.message}"
  end
end

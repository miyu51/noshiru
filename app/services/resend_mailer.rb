require "resend"

class ResendMailer < Devise::Mailer
  default from: "onboarding@resend.dev"

  def confirmation_instructions(record, token, opts = {})
    send_resend_email(record, token, "confirmation_instructions", I18n.t("mailer.confirmation_instructions.subject"))
  end

  def reset_password_instructions(record, token, opts = {})
    send_resend_email(record, token, "reset_password_instructions", I18n.t("mailer.reset_password_instructions.subject"))
  end

  def unlock_instructions(record, token, opts = {})
    send_resend_email(record, token, "unlock_instructions", I18n.t("mailer.unlock_instructions.subject"))
  end

  def email_changed(record, opts = {})
    send_resend_email(record, nil, "email_changed", I18n.t("mailer.email_changed.subject"))
  end

  def password_change(record, opts = {})
    send_resend_email(record, nil, "password_change", I18n.t("mailer.password_change.subject"))
  end

  private

  def send_resend_email(record, token, template, subject)
    Resend.api_key = ENV["RESEND_API_KEY"]

    html = ApplicationController.render(
      template: "devise/mailer/#{template}",
      assigns: { resource: record, token: token }
    )

    Resend::Emails.send(
      from: "onboarding@resend.dev",
      to: record.email,
      subject: subject,
      html: html
    )
  end
end
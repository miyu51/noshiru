require 'google/apis/gmail_v1'
require 'googleauth'
require 'base64'

class GmailSender
  def send_email(to:, subject:, body:)
    service = Google::Apis::GmailV1::GmailService.new

    token = GoogleMailerService.new.access_token
    return unless token
    service.authorization = token
    
    message = Google::Apis::GmailV1::Message.new(raw: encode_email(to, subject, body))
    service.send_user_message('me', message)

    Rails.logger.info "📨 Gmail APIで送信成功：#{to} - #{subject}"
  rescue => e
    Rails.logger.error "⚠️ Gmail API送信失敗：#{e.message}"
  end

  private

  def encode_email(to, subject, body)
    mail = <<~EOF
      To: #{to}
      From: thereishopeforatree.256261219@gmail.com
      Subject: #{subject}
      Content-Type: text/plain; charset="UTF-8"

      #{body}
    EOF
    Base64.urlsafe_encode64(mail)
  end
end

class GmailApiDelivery
  def initialize(values)
    @service = Google::Apis::GmailV1::GmailService.new
    token = GoogleMailerService.new.access_token
    raise "⚠️ Gmail API認証失敗：トークンが取得できません" unless token

    @service.authorization = token
  end

  def deliver!(mail)
    message = Google::Apis::GmailV1::Message.new(
      raw: Base64.urlsafe_encode64(mail.encoded)
    )
    @service.send_user_message('me', message)
    Rails.logger.info "📨 Gmail APIで送信成功：#{mail.to}"
  rescue => e
    Rails.logger.error "⚠️ Gmail API送信失敗：#{e.message}"
  end
end
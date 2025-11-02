require 'google/apis/gmail_v1'

class GmailSender
  def send_email(to:, subject:, body:)
    service = Google::Apis::GmailV1::GmailService.new
    service.authorization = GoogleMailerService.new.access_token
    
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
      Subject: #{subject}
      Content-Type: text/plain; charset="UTF-8"

      #{body}
    EOF
    Base64.urlsafe_encode64(mail)
  end
end

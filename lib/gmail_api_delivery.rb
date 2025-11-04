require 'google/apis/gmail_v1'
require 'googleauth'
require 'base64'

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

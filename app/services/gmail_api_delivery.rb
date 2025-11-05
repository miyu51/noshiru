require 'google/apis/gmail_v1'
require 'googleauth'
require 'base64'

class GmailApiDelivery
  attr_accessor :settings

  def initialize(settings)
    self.settings = settings
  end

  def deliver!(mail)
    service = Google::Apis::GmailV1::GmailService.new

    # 認証情報を settings から取得
    client_id = Google::Auth::ClientId.new(
      settings[:client_id],
      settings[:client_secret]
    )

    credentials = Google::Auth::UserRefreshCredentials.new(
      client_id: client_id,
      scope: ['https://www.googleapis.com/auth/gmail.send'],
      redirect_uri: settings[:redirect_uri],
      refresh_token: settings[:refresh_token]
    )

    credentials.fetch_access_token!
    service.authorization = credentials

    # メール内容をエンコードして送信
    message = Google::Apis::GmailV1::Message.new(
      raw: Base64.urlsafe_encode64(mail.encoded)
    )

    service.send_user_message('me', message)
    Rails.logger.info "📨 Gmail APIで送信成功：#{mail.to}"
  rescue => e
    Rails.logger.error "⚠️ Gmail API送信失敗：#{e.message}"
  end
end
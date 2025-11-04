require 'google/apis/gmail_v1'
require 'googleauth'
require 'base64'

class GmailApiDelivery
  def initialize(values)
    # 認証情報の初期化など
  end

  def deliver!(mail)
    service = Google::Apis::GmailV1::GmailService.new
    service.authorization = Google::Auth.get_application_default(['https://www.googleapis.com/auth/gmail.send'])

    message = Google::Apis::GmailV1::Message.new(
      raw: Base64.urlsafe_encode64(mail.to_s)
    )

    service.send_user_message('me', message)
  end
end

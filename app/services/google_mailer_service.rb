require 'googleauth'

class GoogleMailerService
  def access_token
    Rails.logger.info "🔍 CLIENT_ID: #{ENV['GOOGLE_CLIENT_ID']&.first(20)}..." # 最初の20文字のみ
    Rails.logger.info "🔍 CLIENT_SECRET: #{ENV['GOOGLE_CLIENT_SECRET'] ? '設定済み' : '未設定'}"
    Rails.logger.info "🔍 REDIRECT_URI: #{ENV['GOOGLE_REDIRECT_URI']}"

    client_id = Google::Auth::ClientId.new(
      ENV['GOOGLE_CLIENT_ID'],
      ENV['GOOGLE_CLIENT_SECRET']
    )

    token = Google::Auth::UserRefreshCredentials.new(
      client_id: client_id,
      scope: ['https://www.googleapis.com/auth/gmail.send'],
      redirect_url: ENV['GOOGLE_REDIRECT_URI'],
      refresh_token: ENV['GOOGLE_REFRESH_TOKEN']
    )

    token.fetch_access_token!
    token.access_token
  rescue => e
    Rails.logger.error "⚠️ アクセストークン取得失敗：#{e.message}"
    nil  
  end
end

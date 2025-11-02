require 'googleauth'

class GoogleMailerService
  def access_token
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
  end
end
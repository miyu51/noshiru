require 'googleauth'
require 'googleauth/stores/file_token_store'

class GoogleAuthController < ApplicationController
  def callback
    code = params[:code]
    if code.blank?
      render plain: "認可コードがありません", status: :bad_request
      return
    end

    client_id = Google::Auth::ClientId.new(
      ENV['GOOGLE_CLIENT_ID'],
      ENV['GOOGLE_CLIENT_SECRET']
    )

    authorizer = Google::Auth::UserAuthorizer.new(
      client_id,
      ['https://www.googleapis.com/auth/gmail.send'],
      nil # token_store を使わず、直接取得
    )

    credentials = authorizer.get_credentials_from_code(
      user_id: 'default',
      code: code,
      base_url: ENV['GOOGLE_REDIRECT_URI']
    )

    refresh_token = credentials.refresh_token

    if refresh_token.present?
      # 一時的に表示（あとで.envに保存）
      render plain: "リフレッシュトークンを取得しました：\n#{refresh_token}"
    else
      render plain: "リフレッシュトークンが取得できませんでした", status: :unprocessable_entity
    end
  rescue => e
    render plain: "エラーが発生しました：#{e.message}", status: :internal_server_error
  end
end

module ApplicationHelper
  include InlineSvg::ActionView::Helpers

  def twitter_share_url(text:, url:, hashtags: [], via: nil)
    base = "https://twitter.com/intent/tweet?"
    params = {
      text: text,
      url: url,
      hashtags: hashtags.join(","),
      via: via
    }.compact
    base + params.to_query
  end
end

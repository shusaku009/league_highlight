class VideosController < ApplicationController
  # 動画一覧の画面を作成するためのメソッド(削除予定)
  def find_videos(keyword, after: 1.year.ago, before: Time.zone.now)
    next_page_token = nil

    YoutubeService.list_searches(
      :snippet,
      q: keyword,
      type: 'video',
      max_results: 5,
      video_duration: "medium",
      order: 'relevance',
      page_token: next_page_token,
      published_after: after.iso8601,
      published_before: before.iso8601
    )
  end

  def index
    @youtube_data = find_videos('アーセナル ハイライト')
  end
end
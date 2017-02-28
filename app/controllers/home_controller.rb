class HomeController < ApplicationController
  def index
    return unless signed_in?

    @micropost  = current_user.microposts.build
    @feed_items = current_user.feed.page(params[:page])
  end

  def help; end

  def about; end

  def contact; end
end

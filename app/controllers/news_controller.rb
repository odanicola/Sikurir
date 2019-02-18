class NewsController < FrontendController
  before_action :set_news, only: [:show, :edit, :destroy]

  def index
    @news_all = News.all
  end

  def show
    @news_all = News.all
    @news = News.find_by slug: params[:slug]
  end

  private
  def set_news
    @news = News.find_by slug: params[:slug]
  end

end

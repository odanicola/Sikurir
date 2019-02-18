class Frontend::HomeController < FrontendController
  def index
    @news = News.all
    @news1 = News.all
  end
end

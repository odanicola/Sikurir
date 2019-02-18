class HomeController < ApplicationController
  def index
    @news = News.all
    @news1 = News.all
  end
end

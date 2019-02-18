class Admin::PostsController < AdminController
  def index
    @posts = News.all
  end

  def new
    @post = News.new
  end
end

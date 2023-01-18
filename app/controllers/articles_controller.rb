class ArticlesController < ApplicationController

  def show
    @article = Article.find(params[:id])
  end

  def index
    @articles = Article.all
  end

  def new

  end

  def create
    # When pulling the hash from the user input, the entities need to be whitelisted
    # Within the params, the article symbol is required, and within that, the title and description are permitted
    @article = Article.new(params.require(:article).permit(:title, :description))
    @article.save

    # Redirecting to the new article page
    # redirect_to article_path(@article)
    redirect_to @article
  end

end
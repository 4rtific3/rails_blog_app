class ArticlesController < ApplicationController

  def show
    @article = Article.find(params[:id])
  end

  def index
    @articles = Article.all
  end

  def new
    # Instance var is created when page is first loaded to create an empty var that the error handling (validation) can read
    @article = Article.new
  end

  def edit
    @article = Article.find(params[:id])
  end

  def create
    # When pulling the hash from the user input, the entities need to be whitelisted
    # Within the params, the article symbol is required, and within that, the title and description are permitted
    @article = Article.new(params.require(:article).permit(:title, :description))
    if @article.save
      # Displaying a feedback message when the save is successful
      flash[:notice] = "Article was created successfully"
      # Redirecting to the new article page
      # redirect_to article_path(@article)
      redirect_to @article
    else
      render "new"
    end
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(params.require(:article).permit(:title, :description))
      flash[:notice] = "Article was updated successfully"
      redirect_to @article
    else
      render "edit"
    end
  end

end
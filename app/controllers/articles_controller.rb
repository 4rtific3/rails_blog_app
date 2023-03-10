class ArticlesController < ApplicationController

  before_action :set_article, only: [:show, :edit, :update, :destroy]
  before_action :require_user?, except: [:show, :index]
  before_action :require_same_user, only: [:edit, :update, :destroy]

  def show
  end

  def index
    @articles = Article.paginate(page: params[:page], per_page: 5).order("created_at DESC")
  end

  def new
    # Instance var is created when page is first loaded to create an empty var that the error handling (validation) can read
    @article = Article.new
  end

  def edit
  end

  def create
    # When pulling the hash from the user input, the entities need to be whitelisted
    # Within the params, the article symbol is required, and within that, the title and description are permitted
    @article = Article.new(article_params)
    @article.user = current_user
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
    if @article.update(article_params)
      flash[:notice] = "Article was updated successfully"
      redirect_to @article
    else
      render "edit"
    end
  end

  def destroy
    @article.destroy
    redirect_to articles_path
  end

  # Any methods included below private are only accessible within this file
  private

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :description, category_ids: [])
  end

  def require_same_user
    if current_user != @article.user && !current_user.admin?
      flash[:alert] = "You can only edit or delete your own article"
      redirect_to @article
    end
  end

end
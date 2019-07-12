class ArticlesController < ApplicationController
  before_action :move_to_index, except: :index
  def index
    @articles = Article.all.order("created_at DESC").page(params[:page]).per(5)
  end

  def new
  end

  def create
   Article.create(article_params)
      Article.create(title: article_params[:title], image: article_params[:image], content: article_params[:content],user_id: current_user.id)
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end
  

  def edit
    @article = Article.find(params[:id])
  end

  def update
    article = Article.find(params[:id])
    if article.user_id == current_user.id
      article.update(article_params)
    end
  end




    
  def destroy
    article = Article.find(params[:id])
    if article.user_id == current_user.id
      article.destroy
    end
  end



  private
  def article_params
    params.permit(:title, :image,:content)
  end

  
  

end

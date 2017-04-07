
class ArticlesController < ApplicationController
	before_action :authenticate_user!
	
	http_basic_authenticate_with name: "vijay", password: "12345", except: [:index, :show]

 

	def new
		@article = Article.new
  end

	def edit
	  @article = Article.find(params[:id])
	end

  def index
    @articles = Article.all
  end

	
  def show
    @article = Article.find(params[:id])
  end

	def create
	  @article = Article.new(article_params)
	 
	  if  @article.save
	    redirect_to "/articles/#{@article.id}"
	  else
	    render 'new'
	  end
	end

  def update

	  @article = Article.find(params[:id])
	 
	  if @article.update(article_params)
	    redirect_to "/articles/#{@article.id}"
	  else
	    render 'edit'
	  end
  end
  
  def destroy
    @article = Article.find(params[:id])
    @article.destroy
 
    redirect_to articles_path
  end
	
  private
	  def article_params
	    params.require(:article).permit(:title, :text)
	  end
end

	
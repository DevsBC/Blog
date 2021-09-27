class ArticlesController < ApplicationController

    before_action :find_article, only: [:edit, :update, :show, :destroy]
    before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

    def index
        @articles = Article.all
    end

    def show
    end 

    def new
        @article = Article.new
        @article.title = 'Demo'
    end

    def create
        # @article = Article.create(title: params[:article][:title], 
        #                        content: params[:article][:content],
        #                       user: current_user)
        # O
        @article = current_user.articles.create(article_params)
        redirect_to @article
    end

    def edit
    end

    def update
        @article.update(article_params)
        redirect_to @article
    end

    def destroy
        @article.destroy
        redirect_to root_path
    end

    def find_article
        @article = Article.find(params[:id])
    end

    def article_params
        params.require(:article).permit(:title, :content)
    end

    def from_author
        @user = User.find(params[:user_id])
    end

end

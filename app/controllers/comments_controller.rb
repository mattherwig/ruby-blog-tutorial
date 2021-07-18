class CommentsController < ApplicationController

    http_basic_authenticate_with name: "matt", password: "pass", only: :delete

    def index
        @article = Article.find(params[:article_id])
    end

    def new
        @comment = Comment.new
    end
    
    def create
        @article = Article.find(params[:article_id])
        @comment = @article.comments.create(comment_params)

        if @comment
            redirect_to article_path @article
        else
            render article_path @article
        end
    end

    def destroy
        @article = Article.find(params[:article_id])
        @comment = @article.comments.find(params[:id])
        @comment.destroy

        redirect_to article_path(@article)
    end

    private

        def comment_params
            params.require(:comment).permit(:commenter, :body, :status)
        end

end

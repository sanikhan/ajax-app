class CommentsController < ApplicationController
before_filter :authenticate, :only => [:create, :destroy]

def create
    @article = Article.find(params[:article_id])
    @comments=@article.comments
    @comment=current_user.comments.build(params[:comment])
     @comment.article=Comment.new
   if @comment.save
      flash[:notice] = "Comment was saved"
    else
      flash[:error] = "There was an error saving the comment. Please try again."
    end 
   
    respond_to do |format|
    
    format.html
    format.js
      end
 end
 
 def destroy
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    @comment.destroy
    redirect_to article_path(@article)
    
    respond_to do |format|
    format.html { redirect_to article_path(@article) }
    format.js
  end
  
  def show
  @comment=Comment.new
  @comment=current_user
  end
  
  def index
  @comments = Comment.all
  end
 
  private
    def comment_params
      params.require(:comment).permit(:body)
                               
    end
end
end

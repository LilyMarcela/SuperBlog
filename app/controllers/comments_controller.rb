

class CommentsController < ApplicationController
	def index
	  @comments = Comment.all
	end

	def new
	   @post = Post.find(params[:post_id])
	  @comment = Comment.new
	end

	def create
	  @comment = Comment.new(comment_params)
	  
	  if @comment.save
	    flash[:success] = "Comment successfully added"
	    redirect_to posts_path
	  else
	    render 'new'
	  end
	end

	def show
	  @comment = Comment.find(params[:id])
	end

	def destroy
      @post = Post.find(params[:id])
	  @comment = Comment.find(params[:id])
	  @comment.post_id = @post.id
      @comment.destroy
  	end

	private

	  def comment_params
	    params.require(:comment).permit(:content, :post_id)
	  end


end


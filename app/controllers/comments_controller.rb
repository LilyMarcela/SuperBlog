

class CommentsController < ApplicationController
	before_action :authenticate_author!  
	def index
	  @comments = Comment.all
	end

	def new
	  @post = Post.find(params[:post_id])
	  @comment = Comment.new
	end

	def create
	  @comment = Comment.new(comment_params)
	  @comment.author_id = current_author.id
	  @comment.email = current_author.email
	  
	  if @comment.save
	    flash[:success] = "Comment successfully added"
	    redirect_to request.referer
	  else
	    redirect_to request.referer
	  end
	end

	def show
	  @comment = Comment.find(params[:id])
	end

	def destroy
      
	  @comment = Comment.find(params[:id])
      @comment.destroy
      respond_to do |format|
        format.html { redirect_to request.referer, notice: 'Your comment was deleted.' }
        format.json { head :no_content }
      end
  	end

	private

	  def comment_params
	    params.require(:comment).permit(:content, :post_id)
	  end


end


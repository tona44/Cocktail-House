class CommentsController < ApplicationController

  def create
    @cocktail = Cocktail.find(params[:cocktail_id])
    @comment = current_user.comments.build(comment_params)
    @comment.cocktail_id = @cocktail.id
    @comment.save
    # redirect_to request.referer
    @comments = @cocktail.comments
  end

  def destroy
    @cocktail = Cocktail.find(params[:cocktail_id])
    @comment = @cocktail.comments.find(params[:id])
    @comment.destroy
    # redirect_to request.referer
    @comments = @cocktail.comments
  end


  private

  def comment_params
    params.require(:comment).permit(:comment)
  end

end

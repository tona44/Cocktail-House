class CommentsController < ApplicationController

  def create
    @cocktail = Cocktail.find(params[:cocktail_id])
    @comment = current_user.comments.build(comment_params)
    @comment.cocktail_id = @cocktail.id
    @comment.save
    @comments = @cocktail.comments
    
    # 通知作成
    @user = @cocktail.user
    if @user != current_user
      @user.notifications.create(
        cocktail_id: @cocktail.id,
        from_user_id: current_user.id,
        comment: @comment.comment,
        variety: 2,
        checked: false  # 明示的に記述ver.1(デフォルトでfalseなので無くてもOK)
      )
      # notification.update_attribute(:checked, false)  #明示的に記述ver.2 #この記述は非同期が出来ない
    end
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

class CommentsController < ApplicationController
  def create
    comment = Comment.create(comment_params)
    redirect_to "/prototypes/#{comment.prototype.id}"   #コメントと結びつくツイートの詳細画面に遷移する

  end

  private
  def comment_params
    #ストロングパラメーターを用いて保存できるカラムを指定。
    params.require(:comment).permit(:content).merge(user_id: current_user.id, prototype_id: params[:prototype_id])
  end

end

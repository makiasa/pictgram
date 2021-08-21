class CommentsController < ApplicationController
  def new
    @topic = Topic.find(params[:topic_id])
    @comment = Comment.new
  end

  def create #コメントを登録する
    @comment = Comment.new(comment_params)
    
    if @comment.save #コメント登録の条件分岐
      redirect_to topics_path, success: 'コメントに成功しました' 
    else
      flash.now[:danger] = "コメントに失敗しました"
      render :new
    end
  end
  
  private
  def comment_params
      params.require(:comment).permit(:content).merge(user_id: current_user.id, topic_id: params[:topic_id])
  end
end

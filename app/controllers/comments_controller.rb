class CommentsController < ApplicationController
  def new
    @comment = Comment.new
    @topic_id = params[:topic_id]
  end

  def create #コメントを登録する
    @comment = Comment.new #コメントのインスタンスを作成
    @comment.content = params[:content] #コメントの内容をパラメータから受け取る
    @comment.user_id = current_user.id #ログイン中のユーザーIDを代入
    @comment.topic_id = params[:topic_id] #記事番号をパラメータから受け取る
    
    if @comment.save #コメント登録の条件分岐
      redirect_to topics_path, success: 'コメントに成功しました' 
    else
      flash.now[:danger] = "コメントに失敗しました"
      render :new
    end
  end
end

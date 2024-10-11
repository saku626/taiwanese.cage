class UserSessionsController < ApplicationController
  skip_before_action :require_login, only: %i[new create]

  def new; end
  
  def create
    @user = login(params[:email], params[:password])
  
    if @user
      # ログイン成功時に最終ログイン日時を更新
      # @user.update(last_login_at: Time.zone.now)
      redirect_to default_vocabularies_path, success: "ログインしました"
    else
      flash.now[:danger] = "ログインに失敗しました"
      render :new, status: :unprocessable_entity
    end
  end
  
  def destroy
    logout
    redirect_to root_path, status: :see_other, danger: "ログアウトしました"
  end
end

class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id]) # 正しい形式でユーザーを取得
  end
end

class UserController < ApplicationController
  def index
    if session[:errors] == nil
      session[:errors] = []
    end
    @users = User.all
  end
  def new
    @user = User.new
  end
  def create
    @errors = []
    p 'create!'
    @user = User.new(user_params)
    p @user.name
    p @user.password
    if @user.name == ''
      @errors << '名前を入力してください'
    end
    if @user.password == ''
      @errors << 'パスワードを入力してください'
    end
    if @errors.count == 0
      @user.save
      flash[:mesasge] = '#{@user.name}さんの新規登録に成功しました'
    end
    session[:errors] = @errors
    redirect_to root_path
  end
  private
  def user_params
    params.require(:user).permit(:name, :password)
  end
end


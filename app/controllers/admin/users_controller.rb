class Admin::UsersController < ApplicationController
  # before_action :admin_user, only: [:new, :index, :show, :edit, :update, :destroy] ％iにより短く書ける
  before_action :admin_user, only: %i[new index show edit update destroy]

  PER = 4

  def index
    @users = User.all.order(created_at:"DESC")
    @users = @users.page(params[:page]).per(PER)
  end

  def show
    @user = User.find(params[:id])
    @tasks = @user.tasks
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to admin_users_path, notice:"#{@user.name}を登録しました」"
    else
      render :new
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to admin_user_path(@user), notice:"「#{@user.name}」を更新しました"
    else
      render :new
    end
  end

  def destroy
    @user = User.find(params[:id])
    if @user.destroy
      redirect_to admin_users_path, notice:"「#{@user.name}」削除"
      # else　４６〜４７行は削除失敗ケースが少ない為不要
      #   redirect_to admin_users_path, notice:"「#{@user.name}」削除"
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :admin, :password, :password_confirmation)
  end

  def admin_user
    unless current_user && current_user.admin?
      redirect_to tasks_path, notice:"管理権限無し"
    end
  end

end

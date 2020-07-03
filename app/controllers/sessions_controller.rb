class SessionsController < ApplicationController
    before_action :check, only: [:new]

    def new
    end

    def create
      user = User.find_by(email: params[:session][:email].downcase)
      if user && user.authenticate(params[:session][:password])
        session[:user_id] = user.id
        redirect_to user_path(user.id), notice:"ログイン成功"
      else
        flash[:danger] = "ログイン失敗"
        render :new
      end
    end

    def destroy
      session.delete(:user_id)
      flash[:notice] = "ログアウト完了"
      redirect_to new_session_path
    end

    private

    def check
      if logged_in?
        redirect_to tasks_path, notice:"ログイン中"
      end
    end

  end

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  def correct_user?
    unless logged_in?
    redirect_to new_session_path, notice: "ログインして下さい"
    # flash[:danger] = "権限無し"
    end
  end

end

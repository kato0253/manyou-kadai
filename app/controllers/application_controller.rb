class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  def correct_user?
    unless logged_in?
    redirect_to new_session_path, notice: "ログイン必要"
    end
  end

end

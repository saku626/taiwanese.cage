class TasksController < ApplicationController
  def index
    if logged_in? && (current_user.last_login_at.nil? || current_user.last_login_at.to_date != Date.today)
      flash[:notice] = "今日初めてのログインです！"
    end
  end
end

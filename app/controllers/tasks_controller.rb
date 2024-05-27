class TasksController < ApplicationController
  def index
    # Date.todayをUTCに合わせる
    today_utc = Time.zone.today

    @word_created_today = current_user.last_vocabulary_created_at.present? && current_user.last_vocabulary_created_at.to_date == today_utc

    if logged_in? && current_user.last_login_at.present? && current_user.last_login_at.to_date == today_utc
      @logged_in_today = true
      flash[:notice] = "今日初めてのログインです！"
    else
      @logged_in_today = false
      flash[:notice] = "今日"
    end
  end
end

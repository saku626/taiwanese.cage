class TasksController < ApplicationController
  def index
    # Date.todayをUTCに合わせる
    today_jst = Time.zone.today

    @word_created_today = current_user.last_vocabulary_created_at.present? && current_user.last_vocabulary_created_at.to_date == today_jst
    @logged_in_today = logged_in? && current_user.last_login_at.present? && current_user.last_login_at.to_date == today_jst

    @both_conditions_met = @logged_in_today && @word_created_today
  end
end

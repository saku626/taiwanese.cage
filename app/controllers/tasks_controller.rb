class TasksController < ApplicationController
  def index
    @vocabulary = current_user.vocabularies.find_by(created_at: Date.today.beginning_of_day..Date.today.end_of_day)
    @word_created_today = @vocabulary.present?

    if logged_in? && (current_user.last_login_at.nil? || current_user.last_login_at.to_date != Date.today)
      @logged_in_today = true
      flash[:notice] = "今日初めてのログインです！"
    else
      @logged_in_today = false
    end
  end
end

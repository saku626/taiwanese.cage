class ApplicationController < ActionController::Base
  before_action :require_login
  before_action :update_last_login_time, if: :logged_in?
  add_flash_types :success, :danger

  private
  
  def update_last_login_time
    if current_user.last_login_at.nil? || current_user.last_login_at.to_date != Date.today
      current_user.update(last_login_at: Time.current)
    end
  end
  
  def not_authenticated
    redirect_to login_path
  end
end

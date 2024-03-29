class StaticPagesController < ApplicationController
  skip_before_action :require_login, only: %i[top]
  
  def top
    @requests = Request.where(category_id: 2)
  end
end

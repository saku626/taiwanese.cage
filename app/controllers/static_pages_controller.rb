class StaticPagesController < ApplicationController
  skip_before_action :require_login, only: %i[top]
  
  def top
    target_category = Category.find_by(name: '日常生活')
    @requests = Request.where(category_id: target_category.id)  
    target_category1 = Category.find_by(name: 'ビジネス')
    @requests1 = Request.where(category_id: target_category1.id)
  end
end

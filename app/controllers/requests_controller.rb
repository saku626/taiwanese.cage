class RequestsController < ApplicationController
  def index
    target_category = Category.find_by(name: '日常生活')
    @requests = Request.where(category_id: target_category.id)  
    target_category1 = Category.find_by(name: 'ビジネス')
    @requests1 = Request.where(category_id: target_category1.id)
  end

  def show
    @request = Request.find(params[:id])
  end
end

class RequestsController < ApplicationController
  skip_before_action :require_login, only: [:show]
  
  def index
    target_category = Category.find_by(name: '日常生活')
    @requests = Request.where(category_id: target_category.id)  
    target_category1 = Category.find_by(name: 'ビジネス')
    @requests1 = Request.where(category_id: target_category1.id)
    target_category2 = Category.find_by(name: '数')
    @requests2 = Request.where(category_id: target_category2.id)
    target_category3 = Category.find_by(name: '月・曜日・時制')
    @requests3 = Request.where(category_id: target_category3.id)
    target_category4 = Category.find_by(name: '人')
    @requests4 = Request.where(category_id: target_category4.id)
    target_category5 = Category.find_by(name: '場所')
    @requests5 = Request.where(category_id: target_category5.id)
    target_category6 = Category.find_by(name: 'もの')
    @requests6 = Request.where(category_id: target_category6.id)
  end

  def show
    @request = Request.find(params[:id])
  end
end

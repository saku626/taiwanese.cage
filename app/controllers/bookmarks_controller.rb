class BookmarksController < ApplicationController
  def index
    @category = Category.where(user_id: current_user.id)
    @category_with_requests = {}
    @category.each do |category|
      @category_with_requests[category] = current_user.bookmarks.includes(:request).where(category_id: category.id).order(created_at: :desc).map(&:request)
    end
  end

  def create
    request = Request.find(params[:request_id])
    current_user.bookmark(request)
    redirect_to requests_path, success: t('.success')
  end

  def destroy
    request = current_user.bookmarks.find(params[:id]).request
    current_user.unbookmark(request)
    redirect_to requests_path, success: t('.success'), status: :see_other
  end
end

class BookmarksController < ApplicationController
  def index
    @requests = current_user.bookmark_requests.order(created_at: :desc)
    @category = Category.where(user_id: current_user.id)
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

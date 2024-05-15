class BookmarksController < ApplicationController
  def index
    @category = Category.where(user_id: current_user.id)
    @category_with_requests = {}
    @category_with_vocabularies = {}
    @category.each do |category|
      @category_with_requests[category] = current_user.bookmarks.includes(:request).where(category_id: category.id).order(created_at: :desc).map(&:request)
      @category_with_vocabularies[category] = Vocabulary.where(category_id: category.id).order(created_at: :desc)
    end
  end

  def create
    request = Request.find(params[:request_id])
    category_id = params[:category_id]
    current_user.bookmark(request, category_id)
    redirect_to requests_path, success: "リストに追加しました"
  end

  def destroy
    request = current_user.bookmarks.find(params[:id]).request
    current_user.unbookmark(request)
    redirect_to requests_path, success: "リストから削除しました", status: :see_other
  end
end

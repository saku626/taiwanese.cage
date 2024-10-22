class BookmarksController < ApplicationController
  def index
    @category = Category.where(user_id: current_user.id)
    @category_with_defaults = {}
    @category_with_vocabularies = {}
    @category.each do |category|
      @category_with_defaults[category] = current_user.bookmarks.includes(:default_vocabulary).where(category_id: category.id).order(created_at: :desc).map(&:default_vocabulary)
      @category_with_vocabularies[category] = Vocabulary.where(category_id: category.id).order(created_at: :desc)
    end

    # カテゴリーがない場合にフラグを設定
    @no_categories = @category.empty?
  end

  def create
    default_vocabulary = DefaultVocabulary.find(params[:default_vocabulary_id])
    category_id = params[:category_id]
    current_user.bookmark(default_vocabulary, category_id)
    redirect_to default_vocabularies_path, success: "リストに追加しました"
  end

  def destroy
    default_vocabulary = current_user.bookmarks.find(params[:id]).default_vocabulary
    current_user.unbookmark(default_vocabulary)
    redirect_to default_vocabularies_path, success: "リストから削除しました", status: :see_other
  end
end

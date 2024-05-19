class CategoriesController < ApplicationController
  def new
    @category = Category.new
  end

  def create
    @category = current_user.categories.build(category_params)
    if @category.save
      redirect_to bookmarks_path, success: "カテゴリーを作成しました"
    else
      flash.now[:danger] = "カテゴリーの作成に失敗しました"
      render :new, status: :unprocessable_entity
    end
  end

  def delete_confirm
    @categories = current_user.categories
  end

  def destroy
    @category = current_user.categories.find(params[:category_id])
    @category.destroy
    redirect_to bookmarks_path, status: :see_other, success: "カテゴリーを削除しました"
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end
end

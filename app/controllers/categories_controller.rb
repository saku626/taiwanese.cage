class CategoriesController < ApplicationController
  def new
    @category = Category.new
  end

  def create
    @category = current_user.categories.build(category_params)
    if @category.save
      redirect_to bookmarks_path, success: t('defaults.flash_message.created')
    else
      flash.now[:danger] = t('defaults.flash_message.not_created')
      render :new, status: :unprocessable_entity
    end
  end

  def delete_confirm
    @categories = current_user.categories
  end

  def destroy
    @category = current_user.categories.find(params[:category_id])
    @category.destroy
    redirect_to bookmarks_path, success: "カテゴリーを削除しました"
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end
end

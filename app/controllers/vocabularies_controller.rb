class VocabulariesController < ApplicationController
  def show
    @vocabulary = Vocabulary.find(params[:id])
  end
  
  def new
    @vocabulary = Vocabulary.new
    @category = Category.where(user_id: current_user.id)
  end
  
  def create
    @vocabulary = Vocabulary.new(vocabulary_params)
    @category = Category.where(user_id: current_user.id)
    if @vocabulary.save
      redirect_to @vocabulary, success: "ボキャブラリーが作成されました"
    else
      render :new
    end
  end
  
  private
  
  def vocabulary_params
    params.require(:vocabulary).permit(:title, :bopomofo, :mean, :category_id, :body)
  end
end

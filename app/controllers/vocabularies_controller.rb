class VocabulariesController < ApplicationController
  before_action :set_vocabulary, only: [:edit, :update, :destroy]

  def show
    @vocabulary = Vocabulary.find(params[:id])
  end
  
  def new
    @vocabulary = Vocabulary.new
    @category = Category.where(user_id: current_user.id)
  end
  
  def create
    @vocabulary = current_user.vocabularies.build(vocabulary_params)
    @category = Category.where(user_id: current_user.id)
    if @vocabulary.save
      # 単語作成に成功した場合、ユーザーの last_vocabulary_created_at を更新する
      current_user.update(last_vocabulary_created_at: Time.current)
      redirect_to @vocabulary, success: "単語を作成しました"
    else
      flash.now[:danger] = "単語の作成に失敗しました"
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @category = Category.where(user_id: current_user.id)
  end

  def update
    if @vocabulary.update(vocabulary_params)
      redirect_to @vocabulary, success: "単語を更新しました"
    else
      flash.now[:danger] = "単語の更新に失敗しました"
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @vocabulary.destroy!
    redirect_to vocabularies_path, status: :see_other, success: "単語を削除しました"
  end
  
  private

  def set_vocabulary
    @vocabulary = current_user.vocabularies.find(params[:id])
  end
  
  def vocabulary_params
    params.require(:vocabulary).permit(:title, :bopomofo, :mean, :category_id, :body)
  end
end

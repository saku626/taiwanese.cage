class DefaultVocabulariesController < ApplicationController
  skip_before_action :require_login, only: [:show]
  
  def index
    target_category = Category.find_by(name: '日常生活')
    @default_vocabularies = DefaultVocabulary.where(category_id: target_category.id)  
    target_category1 = Category.find_by(name: 'ビジネス')
    @default_vocabularies1 = DefaultVocabulary.where(category_id: target_category1.id)
    target_category2 = Category.find_by(name: '数')
    @default_vocabularies2 = DefaultVocabulary.where(category_id: target_category2.id)
    target_category3 = Category.find_by(name: '月・曜日・時制')
    @default_vocabularies3 = DefaultVocabulary.where(category_id: target_category3.id)
    target_category4 = Category.find_by(name: '人')
    @default_vocabularies4 = DefaultVocabulary.where(category_id: target_category4.id)
    target_category5 = Category.find_by(name: '場所')
    @default_vocabularies5 = DefaultVocabulary.where(category_id: target_category5.id)
    target_category6 = Category.find_by(name: 'もの')
    @default_vocabularies6 = DefaultVocabulary.where(category_id: target_category6.id)
  end

  def show
    @default_vocabulary = DefaultVocabulary.find(params[:id])
  end
end

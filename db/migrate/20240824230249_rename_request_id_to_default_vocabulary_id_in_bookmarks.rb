class RenameRequestIdToDefaultVocabularyIdInBookmarks < ActiveRecord::Migration[7.0]
  def change
    rename_column :bookmarks, :request_id, :default_vocabulary_id
  end
end

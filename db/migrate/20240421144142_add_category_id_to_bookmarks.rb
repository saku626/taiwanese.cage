class AddCategoryIdToBookmarks < ActiveRecord::Migration[7.0]
  def change
    add_reference :bookmarks, :category, foreign_key: true
  end
end

class CreateBookmarks < ActiveRecord::Migration[7.0]
  def change
    create_table :bookmarks do |t|
      t.references :user, foreign_key: true
      t.references :request, foreign_key: true

      t.timestamps
    end
    add_index :bookmarks, [:user_id, :request_id], unique: true
  end
end

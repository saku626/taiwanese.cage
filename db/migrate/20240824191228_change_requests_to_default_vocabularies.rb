class ChangeRequestsToDefaultVocabularies < ActiveRecord::Migration[7.0]
  def change
    rename_table :requests, :default_vocabularies
  end
end

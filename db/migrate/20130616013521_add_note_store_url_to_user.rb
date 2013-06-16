class AddNoteStoreUrlToUser < ActiveRecord::Migration
  def change
    add_column :users, :evernote_shard_id, :string
  end
end

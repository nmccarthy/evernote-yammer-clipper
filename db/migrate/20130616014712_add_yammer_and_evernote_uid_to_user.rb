class AddYammerAndEvernoteUidToUser < ActiveRecord::Migration
  def change
    add_column :users, :evernote_uid, :string
    add_column :users, :yammer_uid, :string
  end
end

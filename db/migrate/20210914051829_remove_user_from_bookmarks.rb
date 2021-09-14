class RemoveUserFromBookmarks < ActiveRecord::Migration[6.1]
  def change
    add_reference :bookmarks, :bookmark_list, null: false, foreign_key: true
    remove_reference :bookmarks, :user
  end
end

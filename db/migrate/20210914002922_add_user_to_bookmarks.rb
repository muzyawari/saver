class AddUserToBookmarks < ActiveRecord::Migration[6.1]
  def change
    add_reference :bookmarks, :user, null: false, foreign_key: true
    remove_reference :bookmarks, :section
  end
end

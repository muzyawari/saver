class BookmarkList < ApplicationRecord
  belongs_to :user
  has_many :bookmarks
end

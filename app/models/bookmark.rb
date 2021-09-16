class Bookmark < ApplicationRecord
  belongs_to :bookmark_list, dependent: :destroy
end

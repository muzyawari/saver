class Bookmark < ApplicationRecord
  belongs_to :section
  has_one :folder, through: :section
end

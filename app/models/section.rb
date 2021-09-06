class Section < ApplicationRecord
  belongs_to :user, through: :folder
  enum section_type: %i[task bookmark timer]
  validates :visible?, default: false
end

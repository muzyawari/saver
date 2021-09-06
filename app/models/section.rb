class Section < ApplicationRecord
  belongs_to :folder
  has_one :user, through: :folder
  enum section_type: %i[todo bookmark timer]
end

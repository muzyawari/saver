class Task < ApplicationRecord
  belongs_to :section
  has_one :folder, through: :section
  enum completed: %i[todo doing completed], _default: :todo
end

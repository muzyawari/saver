class Task < ApplicationRecord
  belongs_to :section
  enum completed: %i[todo doing completed], _default: :todo
  validates :is_event, default: false
end

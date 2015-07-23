class Todo < ActiveRecord::Base
  validates :description, :priority, presence: true
end

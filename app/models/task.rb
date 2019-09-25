class Task < ApplicationRecord
  belongs_to :user, optional: true
  
  validates :task_name,  presence: true, length: { maximum: 50 }
  validates :note,  length: { maximum: 50 }, allow_nil: true
end

class Todo < ActiveRecord::Base
  def to_pleasent_string
    is_completed = completed ? '[X]' : '[ ]'
    "#{is_completed} #{id}. #{due_date.to_s(:long)} #{todo_text}"
  end
end

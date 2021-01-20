class TodosController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    render plain: Todo.order(:due_date).map { |todo| todo.to_pleasent_string }.join("\n")
  end

  def show
    id = params[:id]
    render plain: Todo.find(id).to_pleasent_string
  end

  def create
    due = Date.parse(params[:due])
    text = params[:text]
    completed = params[:completed]

    new_todo = Todo.create!(
      todo_text: text,
      due_date: due,
      completed: completed
    )

    render plain: "Created a new todo with ID #{new_todo.id}"
  end
end

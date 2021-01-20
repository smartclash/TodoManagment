class TodosController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    render 'index'
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

  def update
    id = params[:id]
    completed = params[:completed]

    Todo.update(id, completed: completed)
    render plain: "Updated #{id} todo completed status to #{completed}"
  end
end

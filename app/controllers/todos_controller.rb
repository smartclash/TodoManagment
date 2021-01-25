class TodosController < ApplicationController
  def index
    @todos = current_user.todos
    render 'index'
  end

  def show
    id = params[:id]
    render plain: Todo.find(id).to_pleasent_string
  end

  def create
    due = Date.parse(params[:due])
    text = params[:text]
    completed = params[:completed] || false

    Todo.create!(
      todo_text: text,
      due_date: due,
      completed: completed,
      user_id: current_user.id
    )

    redirect_back fallback_location: todos_path
  end

  def update
    id = params[:id]
    completed = params[:completed]

    current_user.todos.update(id, completed: completed)
    redirect_back fallback_location: todos_path
  end

  def destroy
    id = params[:id]
    current_user.todos.destroy(id)

    redirect_back fallback_location: todos_path
  end
end

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
    completed = params[:completed] || false

    todo = Todo.new(
      todo_text: params[:text],
      due_date: Date.parse(params[:due]),
      completed: completed,
      user_id: current_user.id
    )

    unless todo.save
      flash[:title] = 'Oops, gotta fix some stuff'
      flash[:error] = todo.errors.full_messages.join(', ')
    end

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

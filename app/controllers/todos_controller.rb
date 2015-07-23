class TodosController < ApplicationController
  def index
    @todos = Todo.all
  end

  def create
    @todo = Todo.new(todo_params) # replacing ".create" with ".new" allows verification that the todo saved

    if @todo.save
      respond_to do |format|
        format.html{redirect_to root_path}
        format.js{}
      end
    else
      @todos = Todo.all
      render :index
    end
    # redirect_to root_path
  end

  def destroy
    @todo = Todo.find(params[:id])
    @todo.destroy

    respond_to do |format|
      format.html{redirect_to root_path}
      format.js
    end
    # redirect_to root_path
  end

  private

    def todo_params
      params.require(:todo).permit(:description, :priority)
    end

end

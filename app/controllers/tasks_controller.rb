class TasksController < ApplicationController
  add_breadcrumb "Home", :root_path
  skip_before_action :verify_authenticity_token
  before_action :find_task, only: [:show, :edit, :update, :destroy]

  def index
    if params[:name].blank?
      @tasks = Task.all.order('created_at DESC')
    else
      @category_id = Category.find_by(name: params[:name]).id
      @tasks = Task.where(category_id: @category_id).order('created_at DESC')
    end
  end

  def show
    add_breadcrumb "Show", :task_path
  end

  def new
    @task = Task.new
    add_breadcrumb "New", :new_task_path
  end

  def create
    @task = Task.new(task_params)

    if @task.save
      redirect_to @task
    else
      render 'new'
    end
  end

  def edit
    add_breadcrumb "Show", :task_path
    add_breadcrumb "Edit", :edit_task_path
  end

  def update
    if @task.update(task_params)
      redirect_to @task
    else
      render 'edit'
    end
  end

  def destroy
    @task.destroy
    redirect_to root_path
  end


  private
  def task_params
    params.require(:task).permit(:title, :description, :company, :url, :category_id)
  end

  def find_task
    @task = Task.find(params[:id])
  end

end

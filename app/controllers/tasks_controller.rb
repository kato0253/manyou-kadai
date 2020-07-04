class TasksController < ApplicationController
  before_action :correct_user

  def index
    @tasks = current_user.tasks.all

    if params[:sort_expired]
      @tasks = current_user.tasks.order(end_date: "DESC").page(params[:page]).per(2)
    elsif params[:sort_priority]
      @tasks = current_user.tasks.order(priority: "ASC").page(params[:page]).per(2)
    elsif
      @tasks = current_user.tasks.order(created_at: "DESC").page(params[:page]).per(2)
    end

    if params[:search].present?
      if params[:name].present? && params[:status].present?
        @tasks = current_user.tasks.name_search(params[:name]).status_search(params[:status]).page(params[:page]).per(2)
      elsif params[:name].present?
        @tasks = current_user.tasks.name_search(params[:name]).page(params[:page]).per(2)
      elsif params[:status].present?
        @tasks = current_user.tasks.status_search(params[:status]).page(params[:page]).per(2)
      end
    end
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.create(task_params)
    @task.user_id = current_user.id
    if @task.save
      redirect_to tasks_path, notice: ('create')
    else
      render :new if @task.invalid?
    end
  end

  def show
    @task = Task.find(params[:id])

  end

  def edit
    @task = Task.find(params[:id])

  end

  def update
    @task = Task.find(params[:id])

    if @task.update(task_params)
      redirect_to tasks_path, notice: ('update')
    else
      render :edit
    end
  end

  def destroy
    @task = Task.find(params[:id])

    @task.destroy
    redirect_to tasks_path, notice: ('destroy')
  end

  private
  def task_params
    params.require(:task).permit(:name, :detail, :end_date, :priority, :status, :user_id)
  end

end

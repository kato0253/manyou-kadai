class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]

    def index
      @tasks = Task.all
    end

    def new
      @task = Task.new
    end

    def create
      @task = Task.create(task_params)
      if @task.save
      redirect_to tasks_path, notice: ('create')
      else
        render :new if @task.invalid?
      end
    end

    def show
    end

    def edit
    end

    def update
      if @task.update(task_params)
        redirect_to tasks_path, notice: ('update')
      else
        render :edit
      end
    end

    def destroy
      @task.destroy
      redirect_to tasks_path, notice: ('destroy')
    end

    private
    def task_params
      params.require(:task).permit(:name, :detail)
    end

    def set_task
      @task = Task.find(params[:id])
    end
  end
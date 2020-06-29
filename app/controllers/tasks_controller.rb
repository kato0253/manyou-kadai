class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]

    def index
      if params[:sort_expired]
        @tasks = Task.all.order(end_date: "DESC").page(params[:page]).per(2)
      elsif params[:sort_priority]
        @tasks = Task.all.order(priority: "ASC").page(params[:page]).per(2)
      elsif
        @tasks = Task.all.order(created_at: "DESC").page(params[:page]).per(2)
      end

      if params[:search].present?
        if params[:name].present? && params[:status].present?
          @tasks = Task.name_search(params[:name]).status_search(params[:status]).page(params[:page]).per(2)
        elsif params[:name].present?
          @tasks = Task.name_search(params[:name]).page(params[:page]).per(2)
        elsif params[:status].present?
          @tasks = Task.status_search(params[:status]).page(params[:page]).per(2)
        end
      end
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
      params.require(:task).permit(:name, :detail, :end_date, :priority, :status)
    end

    def set_task
      @task = Task.find(params[:id])
    end
  end

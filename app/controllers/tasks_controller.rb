class TasksController < ApplicationController
  before_action :correct_user

  def index
    @tasks = current_user.tasks.all.page(params[:page]).per(5)
    @labels = current_user.tasks.all.joins(:labels).where(labels: { id: params[:label_id] })

    # if params[:sort_expired]
    #   @tasks=@tasks.order(end_date: :desc)
    # end
    #
    # if params[:sort_priority]
    #   @tasks=@tasks.order(priority: :asc)
    # end

    if params[:name].present?
      @tasks=@tasks.name_search params[:name]
    end
    if params[:status].present?
      @tasks=@tasks.status_search params[:status]
    end

    if params[:label_id].present?
      @labellings=Labelling.where(label_id: params[:label_id]).pluck(:task_id)
      #Labellingモデル内に.where(抽出条件指定、ラベルIDカラム内に送られて来たラベルIDと一致するIDが無いか調べる).pluck（意味つまむ：抽出データを絞る役割、タスクIDで絞ってる）
      @tasks=@tasks.where(id: @labellings)
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
    params.require(:task).permit(:name, :detail, :end_date, :priority, :status, :user_id, { label_ids: [] })
  end

end

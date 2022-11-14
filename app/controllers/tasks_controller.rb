class TasksController < ApplicationController
  before_action :authenticate_user!, except: [:top, :about]

  def top
  end

  def about
  end

  def index
    #@completed_tasks = current_user.completed_tasks
    #tasks = current_user.tasks

    @active_tasks = Task.where(is_active: true)
    #passive_tasks = tasks.where(is_active: false)
    #@passive_tasks = passive_tasks.where('updated_at > ?', Date.today)
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @task.user_id = current_user.id
    if @task.save
      redirect_to tasks_path, notice: 'タスクの作成が完了しました'
    else
      flash.now[:alert] = 'メッセージを入力してください。'
      render '/tasks/new'
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to tasks_path
  end

  def edit
    @task = Task.find(params[:id])
    if @task.user == current_user
      render "edit"
    else
      redirect_to root_path
    end
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(task_params)
    @task.save
      redirect_to tasks_path
    else
      render 'edit'
    end
  end

  def change
    @task = Task.find(params[:id])
    if @task.is_active == true
      @task.update(is_active: false)
      redirect_to tasks_path
    else
      @task.update(is_active: true)
      redirect_to tasks_path
    end
  end

  def complete
    tasks = current_user.tasks
    passive_tasks = tasks.where(is_active: false)
    @tasks = passive_tasks.all.order(updated_at: :desc)
    @tasks = passive_tasks.page(params[:page]).per(12)
  end

  def today
    tasks = current_user.tasks
    complete_tasks = tasks.where('updated_at > ?', Date.today)
    @passive_tasks = complete_tasks.where(is_active: false)
  end

  private

  def task_params
    params.require(:task).permit(:is_active, :title, :content, :category, :start_time)
  end

  def tasknew_params
    params.permit(:task_id, :start_time, :title, :content, :category)
  end
end

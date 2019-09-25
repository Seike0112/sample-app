class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end
  
  def show
    @task = Task.find(params[:id])
  end
  
  def new
    @task = Task.new
  end
  
  def create
    @task = Task.new(task_params)
    if @task.save
      flash[:success] = '新規作成に成功しました。'
      redirect_to @task
    else
      flash[:danger] = '新規作成に失敗しました'
      render :new
    end
  end
  
  def edit
    @task = Task.find(params[:id])
  end
  
  def update
    @task = Task.find(params[:id])
    if @task.update_attributes(task_params)
      flash[:success] = "タスク情報を更新しました。"
      redirect_to @task
    else
      render :edit
    end
  end
  
  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    flash[:success] = "#{@task.task_name}のデータを削除しました。"
    redirect_to tasks_url
  end
  
  
    private
    

      def task_params
        params.require(:task).permit(:task_name, :note, :id)
      end
    
end

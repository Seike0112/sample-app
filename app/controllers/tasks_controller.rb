class TasksController < ApplicationController
  def index
    @task_names = Task.all
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
  
  
    private

      def task_params
        params.require(:task).permit(:task_name, :note, :id)
      end
    
end

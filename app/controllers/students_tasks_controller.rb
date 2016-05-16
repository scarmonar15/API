class StudentsTasksController < ApplicationController
  before_action :set_students_task, only: [:show, :edit, :update, :destroy]

  # GET /students_tasks
  # GET /students_tasks.json
  def index
    @students_tasks = StudentsTask.all
  end

  # GET /students_tasks/1
  # GET /students_tasks/1.json
  def show
  end

  # GET /students_tasks/new
  def new
    @students_task = StudentsTask.new
  end

  # GET /students_tasks/1/edit
  def edit
  end

  # POST /students_tasks
  # POST /students_tasks.json
  def create
    @students_task = StudentsTask.new(students_task_params)

    respond_to do |format|
      if @students_task.save
        format.html { redirect_to @students_task, notice: 'Students task was successfully created.' }
        format.json { render :show, status: :created, location: @students_task }
      else
        format.html { render :new }
        format.json { render json: @students_task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /students_tasks/1
  # PATCH/PUT /students_tasks/1.json
  def update
    respond_to do |format|
      if @students_task.update(students_task_params)
        format.html { redirect_to @students_task, notice: 'Students task was successfully updated.' }
        format.json { render :show, status: :ok, location: @students_task }
      else
        format.html { render :edit }
        format.json { render json: @students_task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /students_tasks/1
  # DELETE /students_tasks/1.json
  def destroy
    @students_task.destroy
    respond_to do |format|
      format.html { redirect_to students_tasks_url, notice: 'Students task was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_students_task
      @students_task = StudentsTask.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def students_task_params
      params.require(:students_task).permit(:student_id, :task_id)
    end
end

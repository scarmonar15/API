class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  # GET /tasks
  # GET /tasks.json
  def index
    @tasks = Task.all
  end

  # GET /tasks/1
  # GET /tasks/1.json
  def show
  end

  # GET /tasks/new
  def new
    @task = Task.new
  end

  # GET /tasks/1/edit
  def edit
  end

  # POST /tasks
  # POST /tasks.json
  def create
    @task = Task.new(task_params)

    respond_to do |format|
      if @task.save
        format.html { redirect_to @task, notice: 'Task was successfully created.' }
        format.json { render :show, status: :created, location: @task }
      else
        format.html { render :new }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tasks/1
  # PATCH/PUT /tasks/1.json
  def update
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to @task, notice: 'Task was successfully updated.' }
        format.json { render :show, status: :ok, location: @task }
      else
        format.html { render :edit }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    @task.destroy
    respond_to do |format|
      format.html { redirect_to tasks_url, notice: 'Task was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
    
  def get_no_done
    critic_date = params[:d]
    tasks = Task.all
    tasks_response = []
    response = []
    tasks.each do |t|
      if t.done.blank? and t.assignment.limit_date.to_s <= critic_date
        tasks_response << t
      end
    end
    puts "*********************************************** #{tasks_response}"
    puts "+++++++++++++++++++++++++++++++++++++++++++++++ #{tasks}"
    tasks_response.each do |task|
      response << {id: task.id, description: task.description, assignment: task.get_assignment, students: task.get_students}  
    end
    render json: response
  end

  def students
    set_task  
    assignment = @task.assignment
    project = assignment.project
    students = @task.students
    groups = {}
    groups[:id] = project.id
    groups[:title] = project.title
    groups[:description] = project.description
    groups[:students] = []
    students.each do |student|
      groups[:students] << {
        id: student.id,
        name: student.name,
        last_name: student.last_name,
        email: student.email
      }
    end
    render json: groups
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def task_params
      params.require(:task).permit(:description, :assignment_id)
    end
end

class LearningsStudentsController < ApplicationController
  before_action :set_learnings_student, only: [:show, :edit, :update, :destroy]

  # GET /learnings_students
  # GET /learnings_students.json
  def index
    @learnings_students = LearningsStudent.all
  end

  # GET /learnings_students/1
  # GET /learnings_students/1.json
  def show
  end

  # GET /learnings_students/new
  def new
    @learnings_student = LearningsStudent.new
  end

  # GET /learnings_students/1/edit
  def edit
  end

  # POST /learnings_students
  # POST /learnings_students.json
  def create
    @learnings_student = LearningsStudent.new(learnings_student_params)

    respond_to do |format|
      if @learnings_student.save
        format.html { redirect_to @learnings_student, notice: 'Learnings student was successfully created.' }
        format.json { render :show, status: :created, location: @learnings_student }
      else
        format.html { render :new }
        format.json { render json: @learnings_student.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /learnings_students/1
  # PATCH/PUT /learnings_students/1.json
  def update
    respond_to do |format|
      if @learnings_student.update(learnings_student_params)
        format.html { redirect_to @learnings_student, notice: 'Learnings student was successfully updated.' }
        format.json { render :show, status: :ok, location: @learnings_student }
      else
        format.html { render :edit }
        format.json { render json: @learnings_student.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /learnings_students/1
  # DELETE /learnings_students/1.json
  def destroy
    @learnings_student.destroy
    respond_to do |format|
      format.html { redirect_to learnings_students_url, notice: 'Learnings student was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_learnings_student
      @learnings_student = LearningsStudent.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def learnings_student_params
      params.require(:learnings_student).permit(:learning_id, :student_id)
    end
end

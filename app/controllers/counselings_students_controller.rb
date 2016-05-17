class CounselingsStudentsController < ApplicationController
  before_action :set_counselings_student, only: [:show, :edit, :update, :destroy]

  # GET /counselings_students
  # GET /counselings_students.json
  def index
    @counselings_students = CounselingsStudent.all
  end

  # GET /counselings_students/1
  # GET /counselings_students/1.json
  def show
  end

  # GET /counselings_students/new
  def new
    @counselings_student = CounselingsStudent.new
  end

  # GET /counselings_students/1/edit
  def edit
  end

  # POST /counselings_students
  # POST /counselings_students.json
  def create
    @counselings_student = CounselingsStudent.new(counselings_student_params)

    respond_to do |format|
      if @counselings_student.save
        format.html { redirect_to @counselings_student, notice: 'Counselings student was successfully created.' }
        format.json { render :show, status: :created, location: @counselings_student }
      else
        format.html { render :new }
        format.json { render json: @counselings_student.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /counselings_students/1
  # PATCH/PUT /counselings_students/1.json
  def update
    respond_to do |format|
      if @counselings_student.update(counselings_student_params)
        format.html { redirect_to @counselings_student, notice: 'Counselings student was successfully updated.' }
        format.json { render :show, status: :ok, location: @counselings_student }
      else
        format.html { render :edit }
        format.json { render json: @counselings_student.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /counselings_students/1
  # DELETE /counselings_students/1.json
  def destroy
    @counselings_student.destroy
    respond_to do |format|
      format.html { redirect_to counselings_students_url, notice: 'Counselings student was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_counselings_student
      @counselings_student = CounselingsStudent.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def counselings_student_params
      params.require(:counselings_student).permit(:counseling_id, :student_id)
    end
end

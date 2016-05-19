class AssignmentsController < ApplicationController
  before_action :set_assignment, only: [:show, :edit, :update, :destroy]

  # GET /assignments
  # GET /assignments.json
  def index
    unless params["d"].blank?
      @assignments = Assignment.get_by_date(params["d"])
    else
      @assignments = Assignment.all
    end
  end

  # GET /assignments/1
  # GET /assignments/1.json
  def show
  end

  # GET /assignments/new
  def new
    @assignment = Assignment.new
  end

  # GET /assignments/1/edit
  def edit
  end

  # POST /assignments
  # POST /assignments.json
  def create
    @assignment = Assignment.new(assignment_params)

    respond_to do |format|
      if @assignment.save
        format.html { redirect_to @assignment, notice: 'Assignment was successfully created.' }
        format.json { render :show, status: :created, location: @assignment }
      else
        format.html { render :new }
        format.json { render json: @assignment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /assignments/1
  # PATCH/PUT /assignments/1.json
  def update
    respond_to do |format|
      if @assignment.update(assignment_params)
        format.html { redirect_to @assignment, notice: 'Assignment was successfully updated.' }
        format.json { render :show, status: :ok, location: @assignment }
      else
        format.html { render :edit }
        format.json { render json: @assignment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /assignments/1
  # DELETE /assignments/1.json
  def destroy
    @assignment.destroy
    respond_to do |format|
      format.html { redirect_to assignments_url, notice: 'Assignment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def get_groups
    set_assignment
    groups = []
    @assignment.teams.map{|g| groups << g["id"] }
    render json: groups
  end

  def differences
    require 'net/http'

    url = URI.parse("https://bd-alarms.herokuapp.com/assignments.json")
    http = Net::HTTP.new(url.host, url.port)
    request = Net::HTTP::Get.new(url.request_uri)
    http.use_ssl = true  
    res = http.request(request)
    db_assignments = JSON.parse(res.body)
    api_assignments = JSON.parse(Assignment.all.to_json)

    result = []
    api_names = []
    db_names = []
    response = []
    
    db_assignments.map {|aa| db_names << aa["description"]}
    
    api_assignments.each_with_index do |assignment, index|
     unless db_names.include?(assignment["description"])
       result << assignment["id"]
       response << {"limit_date" => assignment["limit_date"], "description" => assignment["description"], "grade" => assignment["grade"]}
     end
   end
   response.each_with_index do |post, index|
     http = Net::HTTP.new(url.host, url.port)
     http.use_ssl = true
     request = Net::HTTP::Post.new(url.path, {'Content-Type' =>'application/json'})
     request.body = post.to_json
     response = http.request(request)
   end
   render json: result
  end

  def assignments_by_date
    @assignments = Assignment.get_by_date(params[:d])
    response = []
    @assignments.each_with_index do |a, i|
      response << a.build_report
    end
    render json: response
  end

  def get_students
    set_assignment
    response = @assignment.build_report
    render json: response
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_assignment
      @assignment = Assignment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def assignment_params
      params.require(:assignment).permit(:limit_date, :description, :grade, :project_id)
    end
end

class TeamsController < ApplicationController
  before_action :set_team, only: [:show, :edit, :update, :destroy]

  # GET /teams
  # GET /teams.json
  def index
    @teams = Team.all
  end

  # GET /teams/1
  # GET /teams/1.json
  def show
  end

  # GET /teams/new
  def new
    @team = Team.new
    @students = Student.students_alone
  end

  # GET /teams/1/edit
  def edit
     @students = Student.students_alone
  end

  # POST /teams
  # POST /teams.json
  def create
    @team = Team.new(team_params)

    respond_to do |format|
      if @team.save
        format.html { redirect_to @team, notice: 'Team was successfully created.' }
        format.json { render :show, status: :created, location: @team }
      else
        format.html { render :new }
        format.json { render json: @team.errors, status: :unprocessable_entity }
      end
    end
    student_ids = params[:student_ids].to_a
    student_ids.each_with_index do |student_id|
      student = Student.where(id: student_id.to_i).first
      @team.students << student
    end
  end

  # PATCH/PUT /teams/1
  # PATCH/PUT /teams/1.json
  def update
    respond_to do |format|
      if @team.update(team_params)
        format.html { redirect_to @team, notice: 'Team was successfully updated.' }
        format.json { render :show, status: :ok, location: @team }
      else
        format.html { render :edit }
        format.json { render json: @team.errors, status: :unprocessable_entity }
      end
    end
    student_ids = params[:student_ids].to_a
    student_ids.each_with_index do |student_id|
      student = Student.where(id: student_id.to_i).first
      @team.students << student
    end
  end

  # DELETE /teams/1
  # DELETE /teams/1.json
  def destroy
    @team.students.each do |s| 
      s.team_id = nil
      s.save
    end

    @team.destroy
    respond_to do |format|
      format.html { redirect_to teams_url, notice: 'Team was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def get_students
    set_team
    students = []
    @team.students.map{|s| students << {id: s["id"], name: s["name"], last_name: s["last_name"], email: s["email"], performance: s.get_performance}}
    response = {id: @team.id, name: @team.name, students: students}
    render json: response
  end

  def differences
    require 'net/http'

    url = URI.parse("https://bd-alarms.herokuapp.com/teams.json")
    http = Net::HTTP.new(url.host, url.port)
    request = Net::HTTP::Get.new(url.request_uri)
    http.use_ssl = true  
    res = http.request(request)


    db_teams = JSON.parse(res.body)
    api_teams = JSON.parse(Team.all.to_json)
    result = []
    api_names = []
    db_names = []
    response = []
    db_teams.map {|de| db_names << de["name"]}
    api_teams.each_with_index do |team, index|
      unless db_names.include?(team["name"])
        result << team["id"]
        response << {"name" => team["name"]}
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

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_team
      @team = Team.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def team_params
      params.require(:team).permit(:name)
    end
end

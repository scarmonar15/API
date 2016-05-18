class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]

  # GET /projects
  # GET /projects.json
  def index
    @projects = Project.all
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
  end

  # GET /projects/new
  def new
    @project = Project.new
  end

  # GET /projects/1/edit
  def edit
  end

  # POST /projects
  # POST /projects.json
  def create
    @project = Project.new(project_params)

    respond_to do |format|
      if @project.save
        format.html { redirect_to @project, notice: 'Project was successfully created.' }
        format.json { render :show, status: :created, location: @project }
      else
        format.html { render :new }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /projects/1
  # PATCH/PUT /projects/1.json
  def update
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to @project, notice: 'Project was successfully updated.' }
        format.json { render :show, status: :ok, location: @project }
      else
        format.html { render :edit }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1  
  # DELETE /projects/1.json 
  def destroy
    @project.destroy
    respond_to do |format|
      format.html { redirect_to projects_url, notice: 'Project was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

 def differences
    require 'net/http'

    url = URI.parse("https://bd-alarms.herokuapp.com/projects.json")
    http = Net::HTTP.new(url.host, url.port)
    request = Net::HTTP::Get.new(url.request_uri)
    http.use_ssl = true  
    res = http.request(request)
    db_projects = JSON.parse(res.body)
    api_projects = JSON.parse(Project.all.to_json)
    result = []
    api_names = []
    db_names = []
    response = []
      
    db_projects.map {|aa| db_names << aa["title"]}
    
    api_projects.each_with_index do |project, index|
     unless db_names.include?(project["title"])
       result << project["id"]
       response << {"title" => project["title"], "description" => project["description"]}
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

  def get_groups
    render json: {message: "Esto ya no se usa"}
  end

  def get_students
    set_project
    #@project.teams.map{|g| groups << g["id"] }
    teams = @project.teams
    students = []
    students = teams.map {|t| t.students}
    groups = {}
    groups[:id] = @project.id
    groups[:title] = @project.title
    groups[:description] = @project.description
    groups[:teams] = []
    teams.each do |team|
      groups[:teams] << {
        id: team.id,
        students: team.get_students
      }
    end
    render json: groups
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_params
      params.require(:project).permit(:title, :description)
    end
end

class TeamsProjectsController < ApplicationController
  before_action :set_teams_project, only: [:show, :edit, :update, :destroy]

  # GET /teams_projects
  # GET /teams_projects.json
  def index
    @teams_projects = TeamsProject.all
  end

  # GET /teams_projects/1
  # GET /teams_projects/1.json
  def show
  end

  # GET /teams_projects/new
  def new
    @teams_project = TeamsProject.new
  end

  # GET /teams_projects/1/edit
  def edit
  end

  # POST /teams_projects
  # POST /teams_projects.json
  def create
    @teams_project = TeamsProject.new(teams_project_params)

    respond_to do |format|
      if @teams_project.save
        format.html { redirect_to @teams_project, notice: 'Teams project was successfully created.' }
        format.json { render :show, status: :created, location: @teams_project }
      else
        format.html { render :new }
        format.json { render json: @teams_project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /teams_projects/1
  # PATCH/PUT /teams_projects/1.json
  def update
    respond_to do |format|
      if @teams_project.update(teams_project_params)
        format.html { redirect_to @teams_project, notice: 'Teams project was successfully updated.' }
        format.json { render :show, status: :ok, location: @teams_project }
      else
        format.html { render :edit }
        format.json { render json: @teams_project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /teams_projects/1
  # DELETE /teams_projects/1.json
  def destroy
    @teams_project.destroy
    respond_to do |format|
      format.html { redirect_to teams_projects_url, notice: 'Teams project was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_teams_project
      @teams_project = TeamsProject.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def teams_project_params
      params.require(:teams_project).permit(:team_id, :project_id)
    end
end

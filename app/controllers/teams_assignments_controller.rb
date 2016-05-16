class TeamsAssignmentsController < ApplicationController
  before_action :set_teams_assignment, only: [:show, :edit, :update, :destroy]

  # GET /teams_assignments
  # GET /teams_assignments.json
  def index
    @teams_assignments = TeamsAssignment.all
  end

  # GET /teams_assignments/1
  # GET /teams_assignments/1.json
  def show
  end

  # GET /teams_assignments/new
  def new
    @teams_assignment = TeamsAssignment.new
  end

  # GET /teams_assignments/1/edit
  def edit
  end

  # POST /teams_assignments
  # POST /teams_assignments.json
  def create
    @teams_assignment = TeamsAssignment.new(teams_assignment_params)

    respond_to do |format|
      if @teams_assignment.save
        format.html { redirect_to @teams_assignment, notice: 'Teams assignment was successfully created.' }
        format.json { render :show, status: :created, location: @teams_assignment }
      else
        format.html { render :new }
        format.json { render json: @teams_assignment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /teams_assignments/1
  # PATCH/PUT /teams_assignments/1.json
  def update
    respond_to do |format|
      if @teams_assignment.update(teams_assignment_params)
        format.html { redirect_to @teams_assignment, notice: 'Teams assignment was successfully updated.' }
        format.json { render :show, status: :ok, location: @teams_assignment }
      else
        format.html { render :edit }
        format.json { render json: @teams_assignment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /teams_assignments/1
  # DELETE /teams_assignments/1.json
  def destroy
    @teams_assignment.destroy
    respond_to do |format|
      format.html { redirect_to teams_assignments_url, notice: 'Teams assignment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_teams_assignment
      @teams_assignment = TeamsAssignment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def teams_assignment_params
      params.require(:teams_assignment).permit(:team_id, :assignment_id)
    end
end

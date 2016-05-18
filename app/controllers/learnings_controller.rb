class LearningsController < ApplicationController
  before_action :set_learning, only: [:show, :edit, :update, :destroy]

  # GET /learnings
  # GET /learnings.json
  def index
    @learnings = Learning.all
  end

  # GET /learnings/1
  # GET /learnings/1.json
  def show
  end

  # GET /learnings/new
  def new
    @learning = Learning.new
  end

  # GET /learnings/1/edit
  def edit
  end

  # POST /learnings
  # POST /learnings.json
  def create
    @learning = Learning.new(learning_params)

    respond_to do |format|
      if @learning.save
        format.html { redirect_to @learning, notice: 'Learning was successfully created.' }
        format.json { render :show, status: :created, location: @learning }
      else
        format.html { render :new }
        format.json { render json: @learning.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /learnings/1
  # PATCH/PUT /learnings/1.json
  def update
    respond_to do |format|
      if @learning.update(learning_params)
        format.html { redirect_to @learning, notice: 'Learning was successfully updated.' }
        format.json { render :show, status: :ok, location: @learning }
      else
        format.html { render :edit }
        format.json { render json: @learning.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /learnings/1
  # DELETE /learnings/1.json
  def destroy
    @learning.destroy
    respond_to do |format|
      format.html { redirect_to learnings_url, notice: 'Learning was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def differences
    require 'net/http'

    url = URI.parse("https://bd-alarms.herokuapp.com/learnings.json")
    http = Net::HTTP.new(url.host, url.port)
    request = Net::HTTP::Get.new(url.request_uri)
    http.use_ssl = true  
    res = http.request(request)

    db_learnings = JSON.parse(res.body)
    api_learnings = JSON.parse(Learning.all.to_json)

    result = []
    api_names = []
    db_names = []
    response = []
    
    db_learnings.map {|de| db_names << de["name"]}
            
    api_learnings.each_with_index do |learning, index|
     unless db_names.include?(learning["name"])
       result << learning["id"]
       response << {"name" => learning["name"]}
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

  def get_students
    set_learning
    students = []
    @learning.students.map{|s| students << {id: s["id"], name: s["name"], last_name: s["last_name"], email: s["email"]}}
    response = {id: @learning.id, name: @learning.name, students: students}
    render json: response
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_learning
      @learning = Learning.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def learning_params
      params.require(:learning).permit(:name)
    end
end

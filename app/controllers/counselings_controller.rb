class CounselingsController < ApplicationController
  before_action :set_counseling, only: [:show, :edit, :update, :destroy]

  # GET /counselings
  # GET /counselings.json
  def index
    @counselings = Counseling.all
  end

  # GET /counselings/1
  # GET /counselings/1.json
  def show
  end

  # GET /counselings/new
  def new
    @counseling = Counseling.new
  end

  # GET /counselings/1/edit
  def edit
  end

  # POST /counselings
  # POST /counselings.json
  def create
    @counseling = Counseling.new(counseling_params)

    respond_to do |format|
      if @counseling.save
        format.html { redirect_to @counseling, notice: 'Counseling was successfully created.' }
        format.json { render :show, status: :created, location: @counseling }
      else
        format.html { render :new }
        format.json { render json: @counseling.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /counselings/1
  # PATCH/PUT /counselings/1.json
  def update
    respond_to do |format|
      if @counseling.update(counseling_params)
        format.html { redirect_to @counseling, notice: 'Counseling was successfully updated.' }
        format.json { render :show, status: :ok, location: @counseling }
      else
        format.html { render :edit }
        format.json { render json: @counseling.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /counselings/1
  # DELETE /counselings/1.json
  def destroy
    @counseling.destroy
    respond_to do |format|
      format.html { redirect_to counselings_url, notice: 'Counseling was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def differences
    require 'net/http'

    url = URI.parse("https://bd-alarms.herokuapp.com/counselings.json")
    http = Net::HTTP.new(url.host, url.port)
    request = Net::HTTP::Get.new(url.request_uri)
    http.use_ssl = true  
    res = http.request(request)

    # url = URI.parse('https://bd-alarms.herokuapp.com/projects.json')
    # req = Net::HTTP::Get.new(url.to_s)
    # res = Net::HTTP.start(url.host, url.port) {|http|
    #   http.request(req)
    # }
    db_counselings = JSON.parse(res.body)
    api_counselings = JSON.parse(Counseling.all.to_json)

    result = []
    api_names = []
    db_names = []
    db_rooms = []
    db_dates = []
    
    db_counselings.map {|de| db_rooms << de["classroom"]}
    db_counselings.map {|de| db_dates << de["date"]}

    api_counselings.each_with_index do |coun, index|
      unless db_rooms.include?(coun["classroom"]) and db_dates.include?(coun["date"])
        result << api_counselings[index]["id"]
      end
    end
    render json: result
  end

  def get_students
    set_counseling
    students = []
    @counseling.students.map{|s| students << {id: s["id"], name: s["name"], last_name: s["last_name"], email: s["email"]}}
    response = {id: @counseling.id, date: @counseling.date, classroom: @counseling.classroom, adviser: @counseling.adviser, students: students}
    render json: response
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_counseling
      @counseling = Counseling.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def counseling_params
      params.require(:counseling).permit(:date, :adviser, :classroom)
    end
end

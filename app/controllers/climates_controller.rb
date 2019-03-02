class ClimatesController < ApplicationController
  require 'net/http'

  before_action :set_climate, only: [:show, :edit, :update, :destroy]

  # GET /climates
  # GET /climates.json
  def index
    # @climates = Climate.all

  end

  # GET /climates/1
  # GET /climates/1.json
  def show
    uri = URI('https://api.sheety.co/8f5bb90a-3df4-4f5a-a41f-603a5000dfea')
    response = Net::HTTP.get(uri)
    @response = JSON.parse(response)
  end

  # GET /climates/new
  def new
    @climate = Climate.new
  end

  # GET /climates/1/edit
  def edit
  end

  # POST /climates
  # POST /climates.json
  def create
    @climate = Climate.new(climate_params)

    respond_to do |format|
      if @climate.save
        format.html { redirect_to @climate, notice: 'Climate was successfully created.' }
        format.json { render :show, status: :created, location: @climate }
      else
        format.html { render :new }
        format.json { render json: @climate.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /climates/1
  # PATCH/PUT /climates/1.json
  def update
    respond_to do |format|
      if @climate.update(climate_params)
        format.html { redirect_to @climate, notice: 'Climate was successfully updated.' }
        format.json { render :show, status: :ok, location: @climate }
      else
        format.html { render :edit }
        format.json { render json: @climate.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /climates/1
  # DELETE /climates/1.json
  def destroy
    @climate.destroy
    respond_to do |format|
      format.html { redirect_to climates_url, notice: 'Climate was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_climate
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def climate_params
      params.fetch(:climate, {})
    end
end

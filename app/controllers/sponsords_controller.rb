class SponsordsController < ApplicationController
  before_action :set_sponsord, only: %i[ show edit update destroy ]

  # GET /sponsords or /sponsords.json
  def index
    @sponsords = Sponsord.all
  end

  # GET /sponsords/1 or /sponsords/1.json
  def show
  end

  # GET /sponsords/new
  def new
    @sponsord = Sponsord.new
  end

  # GET /sponsords/1/edit
  def edit
  end

  # POST /sponsords or /sponsords.json
  def create
    @sponsord = Sponsord.new(sponsord_params)

    respond_to do |format|
      if @sponsord.save
        format.html { redirect_to sponsord_url(@sponsord), notice: "Sponsord was successfully created." }
        format.json { render :show, status: :created, location: @sponsord }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @sponsord.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sponsords/1 or /sponsords/1.json
  def update
    respond_to do |format|
      if @sponsord.update(sponsord_params)
        format.html { redirect_to sponsord_url(@sponsord), notice: "Sponsord was successfully updated." }
        format.json { render :show, status: :ok, location: @sponsord }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @sponsord.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sponsords/1 or /sponsords/1.json
  def destroy
    @sponsord.destroy

    respond_to do |format|
      format.html { redirect_to sponsords_url, notice: "Sponsord was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sponsord
      @sponsord = Sponsord.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def sponsord_params
      params.require(:sponsord).permit(:name, :start_from, :end_to, :student_id)
    end
end

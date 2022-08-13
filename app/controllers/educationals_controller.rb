class EducationalsController < ApplicationController
  before_action :set_educational, only: %i[ show edit update destroy ]

  # GET /educationals or /educationals.json
  def index
    @educationals = Educational.all
  end

  # GET /educationals/1 or /educationals/1.json
  def show
  end

  # GET /educationals/new
  def new
    @educational = Educational.new
  end

  # GET /educationals/1/edit
  def edit
  end

  # POST /educationals or /educationals.json
  def create
    @educational = Educational.new(educational_params)

    respond_to do |format|
      if @educational.save
        format.html { redirect_to educational_url(@educational), notice: "Educational was successfully created." }
        format.json { render :show, status: :created, location: @educational }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @educational.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /educationals/1 or /educationals/1.json
  def update
    respond_to do |format|
      if @educational.update(educational_params)
        format.html { redirect_to educational_url(@educational), notice: "Educational was successfully updated." }
        format.json { render :show, status: :ok, location: @educational }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @educational.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /educationals/1 or /educationals/1.json
  def destroy
    @educational.destroy

    respond_to do |format|
      format.html { redirect_to educationals_url, notice: "Educational was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_educational
      @educational = Educational.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def educational_params
      params.require(:educational).permit(:degree_id, :university_id, :start_at, :end_at)
    end
end

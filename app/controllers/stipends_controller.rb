class StipendsController < ApplicationController
  before_action :set_stipend, only: %i[ show edit update destroy ]

  # GET /stipends or /stipends.json
  def index
    @stipends = Stipend.all.paginate(page: params[:page], per_page: 10)
  end

  # GET /stipends/1 or /stipends/1.json
  def show
  end

  # GET /stipends/new
  def new
    @stipend = Stipend.new
  end

  # GET /stipends/1/edit
  def edit
  end

  # POST /stipends or /stipends.json
  def create
    @stipend = Stipend.new(stipend_params)

    respond_to do |format|
      if @stipend.save
        format.html { redirect_to stipend_url(@stipend), notice: "Stipend was successfully created." }
        format.json { render :show, status: :created, location: @stipend }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @stipend.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /stipends/1 or /stipends/1.json
  def update
    respond_to do |format|
      if @stipend.update(stipend_params)
        format.html { redirect_to stipend_url(@stipend), notice: "Stipend was successfully updated." }
        format.json { render :show, status: :ok, location: @stipend }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @stipend.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stipends/1 or /stipends/1.json
  def destroy
    @stipend.destroy

    respond_to do |format|
      format.html { redirect_to stipends_url, notice: "Stipend was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_stipend
      @stipend = Stipend.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def stipend_params
      params.require(:stipend).permit(:student_id, :amount, :stipend_in, :recevied_at, :recevied_by, :payment_method)
    end
end

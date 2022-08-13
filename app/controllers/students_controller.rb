class StudentsController < ApplicationController
  before_action :set_student, only: %i[ show edit update destroy ]

  # GET /students or /students.json
  def index
    if params[:query].present?
      @students = Student.all.search_in_all_fields(params[:query]).paginate(page: params[:page], per_page: 10)
      unless @students.any?
        @students = Student.all.paginate(page: params[:page], per_page: 10)
        respond_to do |format|
          format.html { redirect_to students_path, notice: "Not students found" }
          format.json { render :show, status: :unprocessable_entity, location: @student }
        end
      end
    else
      @students = Student.all.paginate(page: params[:page], per_page: 10)
    end
  end

  # GET /students/1 or /students/1.json
  def show
  end

  # GET /students/new
  def new
    @student = Student.new
  end

  # GET /students/1/edit
  def edit
  end

  # POST /students or /students.json
  def create
    @student = Student.new(student_params)

    respond_to do |format|
      if @student.save
        format.html { redirect_to student_url(@student), notice: "Student was successfully created." }
        format.json { render :show, status: :created, location: @student }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /students/1 or /students/1.json
  def update
    respond_to do |format|
      if @student.update(student_params)
        format.html { redirect_to student_url(@student), notice: "Student was successfully updated." }
        format.json { render :show, status: :ok, location: @student }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /students/1 or /students/1.json
  def destroy
    @student.destroy

    respond_to do |format|
      format.html { redirect_to students_url, notice: "Student was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_student
      @student = Student.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def student_params
      params.require(:student).permit(:name, :father_name, :mobile_number, :jazzcash_number, :cnic, :address, :father_occupation, :emergency_number, :registered_at, :stipend_start_at, :stipend_end_at, :state, :category_id, :educational_id)
    end
end

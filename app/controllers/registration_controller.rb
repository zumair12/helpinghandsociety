class RegistrationController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[new create]
  before_action :set_category, only: %i[ show edit update destroy ]

  def new
    @student = Student.new
  end

  # POST /registration or /registration.json
  def create
    @registered = RegisteredStudent.build!(student_params)
    @student = @registered.student
    respond_to do |format|
      if @registered.saved?
        format.html { redirect_to root_path, notice: "Registered successfully, Request send to Mam #{Info.mam_name}" }
        format.json { render :show, status: :created, location: @student }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @registered.errors, status: :unprocessable_entity }
      end
    end
  end

private
  def student_params
    params.require(:student)
  end
end

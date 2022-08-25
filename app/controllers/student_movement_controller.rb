class StudentMovementController < ApplicationController
  before_action :set_student, only: %i[update_status]

  def registered_students
    @students = Student.registered.order_by_created.paginate(page: params[:page], per_page: 10)
  end

  def update_status
    respond_to do |format|
      if change_status
        format.html { redirect_to redirect_back_path, notice: "#{@student.name.capitalize} was successfully #{params[:state]}." }
        format.json { render :show, status: :created, location: @student }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  def students_stipend
    @all_students = Student.approved.pending_from(date_from, date_to).order_by_created
    @students = @all_students.paginate(page: params[:page], per_page: 10)
  end

  private

  def date_from
    params[:from].present? ? params[:from].to_date : Date.today.beginning_of_month
  end

  def date_to
    @date_to = params[:to].present? ? params[:to].to_date : Date.today.beginning_of_month
  end

  def change_status
    @student.send("#{params[:state]}!".to_sym)
  end

  def redirect_back_path
    case params[:redirect_back]
    when "registered_students"
      registered_students_path
    else
      student_url(@student)      
    end
  end

  def set_student
    @student = Student.find(params[:id])
  end
end
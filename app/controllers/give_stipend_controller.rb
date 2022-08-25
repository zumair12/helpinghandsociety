class GiveStipendController < ApplicationController
  before_action :set_student

  def clear_pervious
    respond_to do |format|
      if @student.clear_upto(date_to)
        format.html { redirect_to redirect_back_path(params[:redirect_back], back_params), notice: "#{@student.name.capitalize} was successfully clear from pending amount." }
        format.json { render :show, status: :created, location: @student }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def date_to
    params[:date_to].to_date
  end

  def back_params
    params.require(:parameter).permit(:to, :from, :page)
  end

  def set_student
    @student = Student.find(params[:id])
  end
end
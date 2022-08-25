class StipendConcern
  def self.clear_pervious!(student, date_to)
    new(student: student, date_to: date_to).call!
  rescue StandardError
    # raise something
  end

  def initialize(params = {})
    @student = params[:student]
    @date_to = params[:date_to]
  end

  def call!
    Stipend.insert_all!(stipends)
  end

  def stipends
    stipend_months.each_with_object([]) do |stipend_in, list|
      list << {
        amount: Student.stipend_decided_amount,
        student_id: @student.id,
        stipend_in:,
        recevied_at: Date.today,
        recevied_by: Info.mam_name,
        payment_method: "cash by hand"
      }
    end
  end

  def stipend_months
    @student.pending(@date_to)[:months].map {|m, y| "1/#{m}/#(y)".to_date }
  end
end

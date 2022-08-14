class RegisteredStudent
  attr_accessor :params, :degree, :educational, :student, :errors

  def self.build!(params)
    RegisteredStudent.new(params).execute!
  end

  def initialize(params = {})
    @params = params
    @errors = []
  end

  def execute!
    ActiveRecord::Base.transaction do
      self.degree = create(Degree, degree_params)
      self.educational = create(Educational, educational_params)
      self.student = create(Student, student_params)
    end
    self
  rescue StandardError => e
    self      
  end

  def saved?
    !self.errors.any?
  end

  def create(model, params)
    instance = model.create(params)
    if instance.persisted?
      instance
    else
      self.errors << instance.errors.full_messages
      self.errors.flatten!
      raise "Exception in #{model}"
    end
  end

  def degree_params
    params[:educational]
      .require(:degree)
      .permit(:name, :years)
  end

  def educational_params
    params
      .require(:educational)
      .permit(:university_id, :start_at, :end_at)
      .merge(degree_id: self.degree.id)
  end

  def student_params
    params.permit(
      :name, :father_name,
      :mobile_number, :jazzcash_number, :emergency_number,
      :cnic, :address,
      :father_occupation,
      :category_id
    ).merge(educational_id: self.educational.id)
  end
end
# frozen_string_literal: true

class StudentPresenter
  # => Id, Name, Stipend, Months
  def self.student_stipends(students, date)
    students.each_with_object([]) do |student, list|
      list << StudentPresenter.present_object(student, date)
    end
  end

  def self.present_object(student, date)
    pending = student.pending(date)
    {
      id: student.id,
      name: student.full_name,
      amount: pending[:amount],
      months: pending[:readable_month]
    }
  end
end
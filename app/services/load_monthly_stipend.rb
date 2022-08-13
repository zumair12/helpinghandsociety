# frozen_string_literal: true

module LoadMonthlyStipend
  attr_accessor :file, :fetch_data, :serialize_data
  include ImportStudentRecords

  def call!(file)
    @file = file
    fetch!
    serialize_data
    create_records
  end

  def fetch!
    @fetch_data = data(@file, "0")
  end

  def serialize_data
    @serialize_data = @fetch_data[1..].each_with_object([]).each do |record, students|
      stipends = ["january", "february", "march", "april", "may", "june"].each_with_object([]).each do |month, stipends|
        if record[month].present? && record[month].to_s.downcase.include?('clear')
          stipends << {
            amount: 2000,
            stipend_in: to_date(month),
            recevied_at: recevied_date(month),
            payment_method: "Hand Cash",
            recevied_by: "Itself"
          }
        end
      end
      student = {
          category_id: record["roll_no"].downcase.include?('eng') ? eng : med,
          name: record["name"],
        }
      students << { student:, stipends: }
    end
  end

  def create_records
    @serialize_data.each do |record|
      student = Student.new(record[:student])
      if student.save
        record[:stipends].each do |stipend_record|
          stipend = Stipend.new(stipend_record)
          stipend.student_id = student.id
          stipend.save
        end
      end
    end
  end

  def eng
    @eng ||= Category.eng.id
  end

  def med
    @med ||= Category.med.id
  end

  def recevied_date(month)
    case month
    when "january", "february"
      "5-1-2022".to_date
    when "march", "april"
      "5-3-2022".to_date
    when "may", "june"
      "5-5-2022".to_date
    else
      Date.today
    end
  end

  def to_date(month)
    month.to_date
  end

end

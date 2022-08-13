# == Schema Information
#
# Table name: students
#
#  id                :integer          not null, primary key
#  address           :string
#  cnic              :string
#  emergency_number  :string
#  father_name       :string
#  father_occupation :string
#  jazzcash_number   :string
#  mobile_number     :string
#  name              :string
#  registered_at     :date
#  state             :string
#  stipend_end_at    :date
#  stipend_start_at  :date
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  category_id       :integer
#  educational_id    :integer
#
class Student < ApplicationRecord
  belongs_to :category
  has_many :stipends

  after_initialize :init

  enum state: {
    registered: "registered",
    approved: "approved",
    suspend: "suspend",
    rejected: "rejected"
  }

  scope :order_by_created, -> { order(created_at: :asc)}
  scope :search_in_all_fields, -> (text) {
    where(
      column_names
        .map {|field| "#{field} like '%#{text}%'" }
        .join(" or ")
    )
  }
  scope :pending_from, -> (from, to = Date.today) { 
    approved
    .joins(:stipends)
    .where('stipends.stipend_in >= ? AND stipends.stipend_in <= ?', from, to)
    .group('students.id')
    .having("COUNT(students.id) < #{MonthCalculator.count_months(from, to)}")
  }

  def init
    self.state  ||= :registered
    self.registered_at ||= Date.today
  end

  def med?
    category.med?
  end

  def eng?
    category.eng?
  end

  def pending_amount(date_to = Date.today)
    (MonthCalculator.count_months(stipend_start_at, date_to) - stipends.where('stipend_in < ?', date_to).count) * Student.stipend_decided_amount
  end

  def recevied_amount
    stipends.count * Student.stipend_decided_amount
  end

  def readable_pending_months_name(date_to = Date.today)
    pending_months_name(date_to).map {|r| "#{r[0]}" }.join(", ")
  end

  def pending_months_name(date_to = Date.today)
    MonthCalculator.month_names(stipend_start_at, date_to) - recevied_months
  end

  def recevied_months
    stipends.map(&:month_and_year)
  end

  def self.stipend_decided_amount
    2_000
  end
end

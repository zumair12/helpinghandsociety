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
  belongs_to :educational
  has_many :stipends

  validates_presence_of :cnic, :address,
    :name, :father_name, :father_occupation, 
    :jazzcash_number, :mobile_number, :emergency_number

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
    joins(:stipends)
    .where('stipends.stipend_in >= ? AND stipends.stipend_in <= ?', from, to)
    .group('students.id')
    .having("COUNT(students.id) < #{MonthCalculator.count_months(from, to)}")
  }

  scope :last_month, -> {
    where(stipend_end_at: Date.today.beginning_of_month..Date.today.end_of_month)
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

  def amount_recevied
    stipends.count * Student.stipend_decided_amount
  end

  def pending(date_to = Date.today)
    months = MonthCalculator.month_names(stipend_start_at, date_to) - recevied_months
    amount = months.count * Student.stipend_decided_amount
    readable_month = months.map {|m, y| m[0..2] }.join(" ")

    { months:, amount:, readable_month: }
  end

  def recevied_months
    stipends.map(&:month_and_year)
  end

  def full_name
    "#{name} #{father_name}"
  end

  def self.stipend_decided_amount
    2_000
  end

  def clear_upto(date_to)
    StipendConcern.clear_pervious!(self, date_to)
  end
end

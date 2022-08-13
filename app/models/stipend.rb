# == Schema Information
#
# Table name: stipends
#
#  id             :integer          not null, primary key
#  amount         :integer
#  payment_method :string
#  recevied_at    :date
#  recevied_by    :string
#  stipend_in     :date
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  student_id     :integer
#
class Stipend < ApplicationRecord
  belongs_to :student

  def month_and_year
    [stipend_in.strftime("%B"), stipend_in.year]
  end
end

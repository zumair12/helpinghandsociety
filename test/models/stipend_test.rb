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
require "test_helper"

class StipendTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

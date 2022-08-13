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
require "test_helper"

class StudentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

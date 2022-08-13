# == Schema Information
#
# Table name: sponsords
#
#  id         :integer          not null, primary key
#  end_to     :date
#  name       :string
#  start_from :date
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  student_id :integer
#
require "test_helper"

class SponsordTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

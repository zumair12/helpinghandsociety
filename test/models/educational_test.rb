# == Schema Information
#
# Table name: educationals
#
#  id            :integer          not null, primary key
#  end_at        :date
#  start_at      :date
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  degree_id     :integer
#  university_id :integer
#
require "test_helper"

class EducationalTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

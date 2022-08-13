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
class Sponsord < ApplicationRecord
end

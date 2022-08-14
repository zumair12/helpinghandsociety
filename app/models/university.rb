# == Schema Information
#
# Table name: universities
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class University < ApplicationRecord
  has_many :educational
  validates_uniqueness_of :name
end

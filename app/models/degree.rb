# == Schema Information
#
# Table name: degrees
#
#  id         :integer          not null, primary key
#  name       :string
#  years      :decimal(, )
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Degree < ApplicationRecord
  has_many :educational
  enum years: {
    one_year_program: 1,
    two_year_program: 2,
    three_year_program: 3,
    four_year_program: 4,
    five_year_program: 5
  }
  validates_presence_of :name
end

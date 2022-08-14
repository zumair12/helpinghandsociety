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
class Educational < ApplicationRecord
  belongs_to :degree
  belongs_to :university
  has_many :students

  validates_presence_of :end_at, :start_at
end

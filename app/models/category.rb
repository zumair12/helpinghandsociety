# == Schema Information
#
# Table name: categories
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Category < ApplicationRecord
  has_many :students
  enum name: {
    medical: "med",
    engineering: "eng"
  }
  def self.med
    medical.first || Category.create(name: 'med')
  end

  def self.eng
    engineering.first || Category.create(name: 'eng')
  end
end

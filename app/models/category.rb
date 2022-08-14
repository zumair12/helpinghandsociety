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
  def self.med
    Category.where(name: 'Medical') || Category.create(name: 'Medical')
  end

  def self.eng
    Category.where(name: 'Engineering') || Category.create(name: 'Engineering')
  end
end

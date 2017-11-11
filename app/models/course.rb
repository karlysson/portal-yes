class Course < ApplicationRecord
  belongs_to :course_category
  belongs_to :user
  validates_presence_of :name
  validates_presence_of :workload

  def self.search(query)
    where("name like ?","%#{query}%")
  end
end

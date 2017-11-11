class CourseInteration < ApplicationRecord
  belongs_to :course
  belongs_to :user

  def self.search(query)
    where("id like ?","%#{query}%")
  end
end

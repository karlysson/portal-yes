class CurriculumOffice < ApplicationRecord
  belongs_to :curriculum_category
  validates_presence_of :name
  def self.search(query)
    where("name like ?","%#{query}%")
  end
end

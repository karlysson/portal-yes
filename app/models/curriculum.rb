class Curriculum < ApplicationRecord
  belongs_to :curriculum_office, optional: true
  belongs_to :city, optional: true
  def self.search(query)
    where("name like ?","%#{query}%")
  end
end

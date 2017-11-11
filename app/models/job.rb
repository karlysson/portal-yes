class Job < ApplicationRecord
  belongs_to :company
  belongs_to :curriculum_profile
  belongs_to :curriculum_office
  belongs_to :city
  validates_presence_of :name
  def self.search(query)
    where("name like ?","%#{query}%")
  end
end

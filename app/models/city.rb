class City < ApplicationRecord
  belongs_to :state
  validates_presence_of :name

  def self.search(query)
    where("name like ?", "%#{query}%")
  end
end

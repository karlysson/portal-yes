class Reference < ApplicationRecord
  belongs_to :user
  validates_presence_of :name
  validates_presence_of :phone
  def self.search(query)
    where("name like ?","%#{query}%")
  end
end

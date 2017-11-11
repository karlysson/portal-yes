class Contact < ApplicationRecord
  validates_presence_of :name, :email, :phone, :message 
  def self.search(query)
    where("name like ?","%#{query}%")
  end
end

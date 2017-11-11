class Page < ApplicationRecord
  def self.search(query)
    where("name like ?", "%#{query}%")
  end
end

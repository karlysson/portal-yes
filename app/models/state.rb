class State < ApplicationRecord
  validates_presence_of :name
  validates_presence_of :sigla
    def self.search(query)
      where("name like ?","%#{query}%")
    end
end

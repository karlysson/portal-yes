class CompanyCategoryRelationship < ApplicationRecord
  belongs_to :company
  belongs_to :company_category

  def self.search(query)
    where("id like ?","%#{query}%")
  end
end

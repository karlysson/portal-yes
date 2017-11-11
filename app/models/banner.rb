class Banner < ApplicationRecord

	def self.search(query)
		where("name like ?", "%#{query}%")
	end

	has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/site/images/01"
  	validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

end

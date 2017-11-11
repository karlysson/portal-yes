class Company < ApplicationRecord
  belongs_to :city
  # Logo
  has_attached_file :logo, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :logo, content_type: /\Aimage\/.*\z/
  # MultiUpload
  has_many :assets
  accepts_nested_attributes_for :assets, :allow_destroy => true
  attr_accessor :image_file_name, :image_content_type, :image_file_size, :image_updated_at

  def self.search(query)
    where("name like ?","%#{query}%")
  end
end

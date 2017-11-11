class Advertising < ApplicationRecord
  belongs_to :advertising_category
  belongs_to :company
  validates_presence_of :name
  validates_presence_of :description

  has_attached_file :cover, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/assets/admin/anuncio_icon.png"
  validates_attachment_content_type :cover, content_type: /\Aimage\/.*\z/

  # MultiUpload
  has_many :assets
  accepts_nested_attributes_for :assets, :allow_destroy => true
  attr_accessor :image_file_name, :image_content_type, :image_file_size, :image_updated_at

  def self.search(query)
    where("name like ?","%#{query}%")
  end

end


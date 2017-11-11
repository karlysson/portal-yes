class Asset < ApplicationRecord
  # belongs_to :advertising
  # belongs_to :company
 
  belongs_to :advertising, optional: true
  belongs_to :company, optional: true

  # belongs_to :assetable, polymorphic: true, optional: true
  # Transaction still rollback

  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  # has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>", :notic_thumb => "100x50>", :notic_capa => "300x150>", :notic_banner=> "12000x500>" }, :less_than => 4.megabytes, :default_url => "/branco.jpg"
  # validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/, :less_than => 4.megabytes

end

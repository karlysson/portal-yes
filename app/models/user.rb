class User < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :permission, optional: true
  validates  :name, presence: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_attached_file :photo, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/assets/admin/ft.png"
  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\z/

  def self.search(query)
    where("name like ?" , "%#{query}%")
  end
end

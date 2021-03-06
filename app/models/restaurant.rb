class Restaurant < ApplicationRecord
  validates_presence_of :name, :opening_hours
  mount_uploader :image, PhotoUploader
  belongs_to :category
  has_many :comments
end

class Artist < ApplicationRecord
  belongs_to :genre
  has_many :albums, dependent: :destroy
  has_many_attached :images

  scope :with_eager_loaded_images, -> { eager_load(images_attachments: :blob) }
  
  validates_presence_of :name
  validates_presence_of :biography
end

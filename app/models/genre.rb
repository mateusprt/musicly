class Genre < ApplicationRecord
  has_many :artists, dependent: :destroy
  has_many :albums, dependent: :destroy

  validates_presence_of :name
end

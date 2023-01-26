class Album < ApplicationRecord
  belongs_to :artist
  belongs_to :genre
  has_many :songs, dependent: :destroy

  has_one_attached :cover

  validates_presence_of :name
  validates_presence_of :release_date
end

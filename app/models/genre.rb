class Genre < ApplicationRecord
  has_many :artists, dependent: :destroy

  validates_presence_of :name
end

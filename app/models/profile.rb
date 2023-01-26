class Profile < ApplicationRecord
  belongs_to :user
  
  enum role: [:default, :admin]
  
  validates_presence_of :role
  validates_presence_of :name
end

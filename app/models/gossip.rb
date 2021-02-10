class Gossip < ApplicationRecord
  belongs_to :user

  has_many :taggossips
  has_many :tags, through: :taggossips

  has_many :coms
  has_many :likes

  validates :title, :content, presence: true 
  validates :title, length: { minimum: 3, maximum: 14 } 

end

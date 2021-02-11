class Gossip < ApplicationRecord
  belongs_to :user

  has_many :taggossips, dependent: :destroy
  has_many :tags, through: :taggossips

  has_many :coms, dependent: :destroy
  has_many :likes, dependent: :destroy

  validates :title, :content, presence: true 
  validates :title, length: { minimum: 3, maximum: 14 } 

end



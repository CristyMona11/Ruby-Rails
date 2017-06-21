class Song < ActiveRecord::Base
  belongs_to :user
  has_many :songlists
  has_many :songlist_users, through: :songlists, source: :user
  validates :artist, :title, presence: true
  validates :artist, :title, length: { minimum: 2 }
end

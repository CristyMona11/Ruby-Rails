class Dojo < ActiveRecord::Base
  has_many :ninjas
  validates :name, :city, :state, presence: true
  validates :state, length: {maximum: 2}
end

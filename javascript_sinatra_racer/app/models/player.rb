class Player < ActiveRecord::Base
  validates :name, uniqueness: true

  has_many :gameplayers
  has_many :games,  through: :gameplayers
end



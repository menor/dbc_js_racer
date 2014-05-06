class Game < ActiveRecord::Base
  has_many :gameplayers
  has_many :players, through: :gameplayers
end

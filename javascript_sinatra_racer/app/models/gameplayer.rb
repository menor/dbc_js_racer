class Gameplayer < ActiveRecord::Base
  validates :player_id, uniqueness: { scope: :game_id,
    message: "you cannot play against yourself" }
  # validate :there_can_only_be_two_players

  belongs_to :player
  belongs_to :game

  # Return to this later if we can
  # def there_can_only_be_two_players
  #   game_id_count = Gameplayer.find_all_by_game_id(:game_id)
  #   if game_id_count.length > 2
  #     errors.add(:game_id, "There can only be two players in a game" )
  #   end
  # end
end

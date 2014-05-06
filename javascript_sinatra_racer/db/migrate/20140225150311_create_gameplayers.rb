class CreateGameplayers < ActiveRecord::Migration
  def change
    create_table(:gameplayers) do |t|
      t.boolean :winner, :default => false
      t.integer :game_id
      t.integer :player_id
    end
  end
end

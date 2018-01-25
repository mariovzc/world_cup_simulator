class AddGameSubTypeToMatch < ActiveRecord::Migration[5.1]
  def change
    add_reference :matches, :game_sub_type, foreign_key: true
  end
end

class CreateGameTypes < ActiveRecord::Migration[5.1]
  def change
    create_table :game_types do |t|
      t.string :name

      t.timestamps
    end
  end
end

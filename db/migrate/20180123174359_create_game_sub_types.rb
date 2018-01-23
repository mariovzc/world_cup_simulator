class CreateGameSubTypes < ActiveRecord::Migration[5.1]
  def change
    create_table :game_sub_types do |t|
      t.string :name
      t.references :game_type, foreign_key: true

      t.timestamps
    end
  end
end

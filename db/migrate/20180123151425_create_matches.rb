class CreateMatches < ActiveRecord::Migration[5.1]
  def change
    create_table :matches do |t|
      t.integer :team_local_id
      t.integer :team_visitor_id
      t.integer :team_local_score
      t.integer :team_visitor_score
      t.references :phase, foreign_key: true
      t.date :game_day

      t.timestamps
    end
  end
end

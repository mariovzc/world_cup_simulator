class CreateMatches < ActiveRecord::Migration[5.1]
  def change
    create_table :matches do |t|
      t.integer :name
      t.references :match_type, foreign_key: true
      t.integer :home_team_id
      t.integer :away_team_id
      t.timestamp :date
      t.integer :home_result
      t.integer :away_result
      t.references :stadium, foreign_key: true
      t.boolean :finished

      t.timestamps
    end
  end
end

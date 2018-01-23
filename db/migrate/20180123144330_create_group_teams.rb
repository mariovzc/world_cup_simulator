class CreateGroupTeams < ActiveRecord::Migration[5.1]
  def change
    create_table :group_teams do |t|
      t.references :group, foreign_key: true
      t.references :team, foreign_key: true

      t.timestamps
    end
  end
end

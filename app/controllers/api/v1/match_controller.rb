#  id               :integer          not null, primary key
#  name             :integer
#  home_team_id     :integer
#  away_team_id     :integer
#  date             :datetime
#  home_result      :integer
#  away_result      :integer
#  stadium_id       :integer
#  finished         :boolean
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  game_sub_type_id :integer

class Api::V1::MatchController < ApplicationController
  def get_groups   
    create_group_phase_matches
    @data = GameType.first.game_sub_types
  end
  def round_16
    @data = {name: 'hola'}
  end

  private
  def create_group_phase_matches
    file = JSON.parse(File.read('db/data.json'))
    file = file['groups']
    ##This is if the call is for new teams
    if (Match.count >= 48)
      Match.delete_all
    end
    file.each do |key, array|
      array['matches'].to_a.each do |match|
        game_sub_type = GameSubType.where(name: key.capitalize)[0]
        home_result = get_score
        away_result = get_score
        #Winner info: 1 local , 2 away , 0 draw
        winner = home_result > away_result ? 1 : away_result > home_result ? 2 : 0
      Match.create(
          name: match['name'].to_i, 
          home_team_id: match['home_team'].to_i, 
          away_team_id: match['away_team'].to_i,
          home_result: home_result,
          away_result: away_result,
          date: Time.parse(match['date']),
          stadium_id: match['stadium'].to_i,
          game_sub_type: game_sub_type,
          winner: winner
        )
      end
    end
  end
  def get_score
    rand(0..5)
  end
end

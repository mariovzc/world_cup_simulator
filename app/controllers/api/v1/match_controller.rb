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
#  Winner 1 local , 2 away , 0 draw !MUST BE IN THE MATCH!

class Api::V1::MatchController < ApplicationController
  def get_groups   
    if(Match.count == 0)
      create_group_phase_matches
    end
    @data = GameType.first.game_sub_types
  end
  def round_16
    
    if (Match.count == 48)
      create_round_16_phase_matches
    end

    @data = GameType.last.game_sub_types.find(9).matches
  end

  def round_8
    if(Match.count == 56)
      create_round_8_phase_matches
    end
    @data = GameType.last.game_sub_types.find(10).matches
  end
  private
  def create_group_phase_matches
    file = JSON.parse(File.read('db/data.json'))
    file = file['groups']
    file.each do |key, array|
      array['matches'].to_a.each do |match|
        game_sub_type = GameSubType.where(name: key.capitalize)[0]
        home_result = get_score
        away_result = get_score
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
  def create_round_16_phase_matches
    file = JSON.parse(File.read('db/data.json'))
    file = file['knockout']['round_16']['matches']
    game_sub_type = GameSubType.where(name: "Round of 16")[0]
    file.each do |match|
      home_team,away_team = get_teams_to_group(match["home_team"], match["away_team"])
      home_result, away_result = get_score, get_score

      winner = home_result > away_result ? 1 : away_result > home_result ? 2 : 0
      Match.create(
        name: match["name"], 
        home_team: home_team,
        away_team: away_team,
        date: Time.parse(match['date']),
        stadium_id: match['stadium'].to_i,
        home_result: home_result,
        game_sub_type: game_sub_type,
        away_result: away_result,
        winner: winner
      )
    end
  end
  def create_round_8_phase_matches
    file = JSON.parse(File.read('db/data.json'))
    file = file['knockout']['round_8']['matches']
    teams = []
    file.each do |match|
      game_sub_type = GameType.last.game_sub_types.find(10)
      home_team = get_winner_from_match(match["home_team"])
      away_team = get_winner_from_match(match["away_team"])
      home_team_score = get_score
      away_team_score = get_score
      winner =  home_team_score > away_team_score ? 1 : 2
      Match.create(
        name: match['name'].to_i, 
        home_team_id: home_team.id, 
        away_team_id: away_team.id,
        home_result: home_team_score,
        away_result: away_team_score,
        date: Time.parse(match['date']),
        stadium_id: match['stadium'].to_i,
        game_sub_type: game_sub_type,
        winner: winner
      )
    end
  end
  def get_score
    rand(0..5)
  end
  def get_ids_of_teams(group)
    arr = [
      { group: 'A', ids: (1..4).to_a },
      { group: 'B', ids: (5..8).to_a },
      { group: 'C', ids: (9..12).to_a },
      { group: 'D', ids: (13..16).to_a },
      { group: 'E', ids: (17..20).to_a },
      { group: 'F', ids: (21..24).to_a },
      { group: 'G', ids: (25..28).to_a },
      { group: 'H', ids: (29..32).to_a }
    ]
    arr.find {|x| x[:group] == group}[:ids]
  end
  def get_team(id)
    team =Team.find(id)
  end
  def get_group_phase_teams
    teams = []
    GameType.first.game_sub_types.each do |sub|
      team_group = []
      teams_ids = get_ids_of_teams(sub.name)
      teams_ids.each do |id|
        team_matches_home = sub.matches.where(home_team_id: id)
        team_matches_away = sub.matches.where(away_team_id: id)
        points = 0
        team_matches_home.each do |match|
          points += match.winner == 1 ? 3 : match.winner == 0 ? 1 : 0
        end
        team_matches_away.each do |match|
          points += match.winner == 1 ? 0 : match.winner == 0 ? 1 : 3
        end
        team_group << {team: get_team_name(id), points: points}

      end
      team_group = team_group.sort_by! { |hsh| hsh[:points] }
      teams << {group: sub.name, teams: team_group.reverse }
    end
    teams
  end
  def group_phase_winners
    teams = []
    GameType.first.game_sub_types.each do |sub|
      team_group = []
      teams_ids = get_ids_of_teams(sub.name)
      teams_ids.each do |id|
        team_matches_home = sub.matches.where(home_team_id: id)
        team_matches_away = sub.matches.where(away_team_id: id)
        points = 0
        team_matches_home.each do |match|
          points += match.winner == 1 ? 3 : match.winner == 0 ? 1 : 0
        end
        team_matches_away.each do |match|
          points += match.winner == 1 ? 0 : match.winner == 0 ? 1 : 3
        end
        team_group << {team: get_team(id), points: points}

      end
      team_group = team_group.sort_by! { |hsh| hsh[:points] }
      team_group = team_group.reverse
      teams << {group: sub.name, teams: team_group[0..-3] }
    end
    teams
  end
  def get_teams_to_group(_winner, _runner)
    
    _winner = _winner.split('_')[1].capitalize!
    winner = group_phase_winners.find {|x| x[:group] == _winner}
    winner = winner[:teams].first
    
    _runner = _runner.split('_')[1].capitalize!
    runner = group_phase_winners.find {|x| x[:group] == _runner}
    runner = runner[:teams].last

    return  winner[:team], runner[:team]
  end

  def get_winner_from_match(match)
    _match = Match.where(name: match)[0]    
    return _match.winner === 1 ? _match.home_team : _match.away_team
  end
end

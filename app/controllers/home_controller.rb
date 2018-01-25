class HomeController < ApplicationController
  def index
    @matches = Match.count
    @groups_phase = get_group_teams
  end

  private
  def get_group_teams
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
      teams << {group: sub.name, teams: team_group.reverse }
    end
    teams
  end
end

class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
  
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
end

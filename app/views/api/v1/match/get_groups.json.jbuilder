json.group @data do |group|
  json.(group, :name)
  json.matches group.matches do |match|
    json . (match, :name, :home_team, :away_team, :date, :home_result, :away_result, :stadium, :winner)
  end
end
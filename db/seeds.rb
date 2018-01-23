p "Init seed"

p "Groups and sub groups Seed"

game_types = ["groups", "knockout"]

sub_groups = [('A'..'H').to_a, ["Round of 16", "Quarter-finals", "Semi-finals", "Third place play-off", "Final"]]

game_types.each_with_index do |type, index|
  t = GameType.first_or_create(name: type)
  sub_groups[index].each do |sub|
    GameSubType.first_or_create(name: sub, game_type: t)
  end
end

p "Finish group and sub groups seed"

json = ActiveSupport::JSON.decode(File.read("db/data.json"))

p "Stadiums seed"
json["stadiums"].each do |stadium|
  Stadium.first_or_create(name: stadium["name"], city: stadium["city"])
end
p "Finish stadium seed"

p "Teams Seed"
json["teams"].each do |team|
  Team.first_or_create(name: team["name"], iso2: team["iso2"])
end
p "Finish team Seed"

p "Seed finished"

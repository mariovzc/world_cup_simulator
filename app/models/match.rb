# == Schema Information
#
# Table name: matches
#
#  id                 :integer          not null, primary key
#  team_local_id      :integer
#  team_visitor_id    :integer
#  team_local_score   :integer
#  team_visitor_score :integer
#  phase_id           :integer
#  game_day           :date
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

class Match < ApplicationRecord
  belongs_to :phase
  belongs_to :team_local, class_name: "Team"
  belongs_to :team_visitor, class_name: "Team"

end

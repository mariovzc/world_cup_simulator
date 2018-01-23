# == Schema Information
#
# Table name: group_teams
#
#  id         :integer          not null, primary key
#  group_id   :integer
#  team_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class GroupTeam < ApplicationRecord
  belongs_to :group
  belongs_to :team
end

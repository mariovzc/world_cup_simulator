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

require 'rails_helper'

RSpec.describe GroupTeam, type: :model do
  describe "Associations" do
    it { should belong_to(:team) }
    it { should belong_to(:group) }
  end
end

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

require 'rails_helper'

RSpec.describe Match, type: :model do
  describe "Associations" do
    it { should belong_to(:team_local) }
    it { should belong_to(:team_visitor) }
  end

end

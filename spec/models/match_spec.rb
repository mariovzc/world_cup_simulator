# == Schema Information
#
# Table name: matches
#
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
#  winner           :integer
#

require 'rails_helper'

RSpec.describe Match, type: :model do
  describe "Validations" do
    it { should validate_presence_of(:date) }
  end
  describe "Associations" do
    it { should belong_to(:home_team) }
    it { should belong_to(:away_team) }
    it { should belong_to(:stadium) }
  end
end

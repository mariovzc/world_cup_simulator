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
#

class Match < ApplicationRecord
  after_initialize :init

  validates :date, presence: true

  belongs_to :stadium
  belongs_to :game_sub_type
  belongs_to :home_team, class_name: "Team", foreign_key: 'home_team_id'
  belongs_to :away_team, class_name: "Team", foreign_key: 'away_team_id'

  private

  def init
    self.finished ||= true
  end
end

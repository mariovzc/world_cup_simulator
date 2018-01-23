# == Schema Information
#
# Table name: matches
#
#  id            :integer          not null, primary key
#  name          :integer
#  match_type_id :integer
#  home_team_id  :integer
#  away_team_id  :integer
#  date          :datetime
#  home_result   :integer
#  away_result   :integer
#  stadium_id    :integer
#  finished      :boolean
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Match < ApplicationRecord
  after_initialize :init

  belongs_to :match_type
  belongs_to :stadium

  validates :date, presence: true

  belongs_to :home_team, class_name: "Team"
  belongs_to :away_team, class_name: "Team"

  def init
    self.finished ||= false
  end
end

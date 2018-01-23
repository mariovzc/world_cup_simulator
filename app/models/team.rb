# == Schema Information
#
# Table name: teams
#
#  id         :integer          not null, primary key
#  name       :string
#  iso2       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Team < ApplicationRecord
  validates :name, presence: true
  validates :iso2, presence: true

  has_many :home_team_id, class_name: 'Match', foreign_key: 'home_team_id'  
  has_many :away_team_id, class_name: 'Match', foreign_key: 'away_team_id'  

end

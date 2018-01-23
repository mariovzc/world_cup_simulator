# == Schema Information
#
# Table name: game_types
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class GameType < ApplicationRecord
  validates :name, presence: true
end

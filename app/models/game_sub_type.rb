# == Schema Information
#
# Table name: game_sub_types
#
#  id           :integer          not null, primary key
#  name         :string
#  game_type_id :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class GameSubType < ApplicationRecord
  belongs_to :game_type
  validates :name, presence: true
end

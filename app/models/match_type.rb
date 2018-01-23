# == Schema Information
#
# Table name: match_types
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class MatchType < ApplicationRecord
  validates :name, presence: true
end

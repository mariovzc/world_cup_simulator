# == Schema Information
#
# Table name: phases
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Phase < ApplicationRecord
  validates :name, presence: true
  has_many :matches
  
end

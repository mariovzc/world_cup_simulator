# == Schema Information
#
# Table name: stadia
#
#  id         :integer          not null, primary key
#  name       :string
#  city       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Stadium < ApplicationRecord
  validates :name, presence: true
  validates :city, presence: true
  has_many :matches
end

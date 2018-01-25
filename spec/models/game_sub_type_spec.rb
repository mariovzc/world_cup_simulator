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

require 'rails_helper'

RSpec.describe GameSubType, type: :model do
  describe "Validations" do
    it { should validate_presence_of(:name) }
  end
  describe "Associations" do
    it { should belong_to(:game_type) }
  end

end

# == Schema Information
#
# Table name: match_types
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe MatchType, type: :model do
  describe "Validations" do
    it { should validate_presence_of(:name) }
  end

end

# == Schema Information
#
# Table name: phases
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe Phase, type: :model do
  describe "Validations" do
    it { should validate_presence_of(:name) }
  end
end

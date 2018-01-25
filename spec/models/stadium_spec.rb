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

require 'rails_helper'

RSpec.describe Stadium, type: :model do
  describe "Validations" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:city) }
  end
end

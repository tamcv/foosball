require 'rails_helper'

RSpec.describe Game, type: :model do
  it { is_expected.to validate_presence_of :number }
  it { should validate_inclusion_of(:number).in_range(1..3) }
end

require 'rails_helper'

RSpec.describe Idea, type: :model do
  it { should define_enum_for(:quality) }
  it do
    should define_enum_for(:quality).
      with([:swill, :possible, :genius])
  end
end

require 'rails_helper'

RSpec.describe Host do

  it 'spec_name' do
    expect(1).to eq 1
    expect(1).to eq 2
  end

  it { should have_many(:accomodations)}
end

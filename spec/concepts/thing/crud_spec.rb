require 'rails_helper'

describe Thing::Create do
  it 'persists valid' do
    thing = Thing::Create.(thing: {
      name: 'Rails',
      description: 'Kickass web dev'
    }).model

    expect(thing).to be_persisted
    expect(thing.name).to eq 'Rails'
    expect(thing.description).to eq 'Kickass web dev'
  end
end

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

  it 'invalid' do
    res, op = Thing::Create.run(thing: {name: ''})

    expect(res).to eq false
    expect(op.model).to_not be_persisted
    expect(op.contract.errors.to_s).to eq "{:name=>[\"can't be blank\"]}"
  end

  it 'invalid description' do
    res, op = Thing::Create.run(thing: {name: 'Rails', description: 'hi'})

    expect(res).to eq false
    expect(op.contract.errors.to_s).to eq "{:description=>[\"is too short (minimum is 4 characters)\"]}"
  end
end

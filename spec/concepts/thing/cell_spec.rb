require 'rails_helper'

describe Thing::Cell do
  include Cell::Testing
  controller ThingsController

  before do
    Thing::Create.(thing: {name: 'Rails'})
    Thing::Create.(thing: {name: 'Trailblazer'})
  end

  subject do
    Capybara::Node::Simple.new(concept('thing/cell/grid').())
  end

  it { expect(subject).to have_selector ".columns.end .header a", text: "Rails" }
  it { expect(subject).to_not have_selector ".columns.end .header a", text: "Trailblazer" }
  it { expect(subject).to have_selector ".columns .header a", text: "Trailblazer" }
end

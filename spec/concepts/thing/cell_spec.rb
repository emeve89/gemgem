require 'rails_helper'

describe Thing::Cell do
  include Cell::Testing
  controller ThingsController

  let(:rails) { Thing::Create.(thing: {name: 'Rails'}).model }
  let(:trb) { Thing::Create.(thing: {name: 'Trailblazer' }).model }
  let(:cell) { concept('thing/cell', collection: [rails, trb], last: trb) }

  subject do
    Capybara::Node::Simple.new(cell)
  end

  it { expect(subject).to have_selector ".columns .header a", text: "Rails" }
  it { expect(subject).to_not have_selector ".columns.end .header a", text: "Rails" }
  it { expect(subject).to have_selector ".columns.end .header a", text: "Trailblazer" }
end

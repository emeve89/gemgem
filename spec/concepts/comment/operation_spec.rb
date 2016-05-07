require 'rails_helper'

describe 'Comment Operation Spec' do
  let(:thing) { Thing::Create.(thing: {name: 'Ruby'}).model }

  describe 'Create' do
    it 'persists valid' do
      _, op = Comment::Create.run(
        comment: {
          body: 'Fantastic!',
          weight: '1',
          user: { email: 'jonny@trb.org' }
        },
        thing_id: thing.id
      )

      comment = op.model

      expect(comment).to be_persisted
      expect(comment.body).to eq('Fantastic!')
      expect(comment.weight).to eq 1

      expect(comment.user).to be_persisted
      expect(comment.user.email).to eq('jonny@trb.org')

      expect(op.thing).to eq(thing)
    end

    it 'invalid email' do
      res, op = Comment::Create.run(
        comment: {
          user: {
            email: '123@'
          }
        },
        thing_id: thing.id
      )

      expect(res).to eq false
      expect(op.errors.messages[:body]).to eq(["is too short (minimum is 6 characters)"])
      expect(op.errors.messages[:weight]).to eq(["is not included in the list"])
    end
  end
end

require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:user) { FactoryBot.create(:user)}
  let(:comment) { Comment.new(content: 'teste', user: user)}

  it { expect(comment).to belong_to(:user) }

  context 'when params are valid' do
    it 'comment valid' do
      expect(comment).to be_valid
    end
  end


  context 'when params are invalid' do
    let(:comment) { Comment.new(content: '', user: user)}

    it 'comment is invalid' do
      expect(comment.valid?).to eq(false)
    end

    it 'error message' do
      comment.valid?
      expect(comment.errors.details[:content][0][:error]).to eq(:blank)
    end
  end
end

require 'rails_helper'

RSpec.describe User, type: :model do
  subject do
    User.new(name: 'john', email: 'johnadibe1234@gmail.com', password: '111111')
  end
  before { subject.save }

  it 'name should not be nil' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'should valid the name' do
    subject.name = 'Goodluck'
    expect(subject).to be_valid
  end
end

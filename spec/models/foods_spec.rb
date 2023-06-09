require 'rails_helper'
RSpec.describe Food, type: :model do
  subject do
    @user = User.create(name: 'John', email: 'johnadibe1234@gmail.com', password: '111111')
    Food.create(name: 'pizza', measurement_unit: 'grams', price: 2, quantity: 1, user: @user)
  end

  before(:each) { subject.save }

  it 'should have name' do
    expect(subject.name).to eql('pizza')
  end

  it 'should have Measurement unit grams' do
    expect(subject.measurement_unit).to eql('grams')
  end

  it 'Should always have Measurement unit present' do
    subject.measurement_unit = nil
    expect(subject).to_not be_valid
  end

  it 'should have price of 2' do
    expect(subject.price).to eql(2)
  end

  it 'Should the quantity  present' do
    expect(subject.quantity).to eql(1)
  end

  it 'Price should be greater than or equal to 0' do
    subject.price = -1
    expect(subject).to_not be_valid
  end

  it 'Price should be an integer' do
    subject.price = 'string'
    expect(subject).to_not be_valid
  end
end

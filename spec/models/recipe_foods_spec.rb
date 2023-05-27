require 'rails_helper'

RSpec.describe RecipeFood, type: :model do
  describe 'recipe_foods model' do
    user = User.create(name: 'Goodluck', email: 'johnadibe123@gmail.com', password: '111111')
    subject { Food.new(user_id: user, name: 'Sugar', measurement_unit: 'grams', price: 6) }
    before { subject.save }

    it 'should check that the name is not blank' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'should check that the measurement_unit is not blank' do
      subject.measurement_unit = nil
      expect(subject).to_not be_valid
    end

    it 'should check that the price is not blank' do
      subject.price = nil
      expect(subject).to_not be_valid
    end
  end
end

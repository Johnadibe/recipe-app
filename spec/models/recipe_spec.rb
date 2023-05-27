require 'rails_helper'

RSpec.describe Recipe, type: :model do
  describe 'Recipe model' do
    before(:each) do
      @user = User.create name: 'Goodluck', email: 'johnadibe123@gmail.com', password: '111111'
    end

    it 'the name must not be blank' do
      recipe = Recipe.create name: '', cooking_time: 25, preparation_time: 15, description: 'Steps goes here',
                             public: true, user: @user
      expect(recipe).to_not be_valid
    end
  end
end

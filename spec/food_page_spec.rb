require 'rails_helper'

RSpec.describe 'in user food index page', js: true, type: :system do
  before(:all) do
    user1 = User.create({ name: 'Mario', email: 'user1@mail.com', password: '111111', confirmed_at: '2021-01-01' })
    recipe1 = Recipe.create({ name: 'Sandwich', preparation_time: '1h', cooking_time: '2h', description: 'Make a Sandwich', user_id: user1.id })
    food1 = Food.create({ name: 'Ham', measurement_unit: 'Kg', price: 20, user_id: user1.id })
    RecipeFood.create({ quantity: 2, food_id: food1.id, recipe_id: recipe1.id })
  end

  describe 'I can see' do
    it 'the Food\'s name' do
      visit new_user_session_path
      fill_in 'email', with: 'user1@mail.com'
      fill_in 'password', with: '111111'
      click_button 'Log in'
      click_link 'My Ingredients'
      food = Food.find_by(name: 'Ham')
      expect(page).to have_content(food.name)
    end

    it 'the food\'s measurement unit' do
      visit new_user_session_path
      fill_in 'email', with: 'user1@mail.com'
      fill_in 'password', with: '111111'
      click_button 'Log in'
      click_link 'My Ingredients'
      food = Food.find_by(name: 'Ham')
      expect(page).to have_content(food.measurement_unit)
    end

    it 'the food\'s price' do
      visit new_user_session_path
      fill_in 'email', with: 'user1@mail.com'
      fill_in 'password', with: '111111'
      click_button 'Log in'
      click_link 'My Ingredients'
      food = Food.find_by(name: 'Ham')
      expect(page).to have_content(food.price)
    end

    it 'the Remove button' do
      visit new_user_session_path
      fill_in 'email', with: 'user1@mail.com'
      fill_in 'password', with: '111111'
      click_button 'Log in'
      click_link 'My Ingredients'
      expect(page).to have_button('Remove')
    end

    it 'the Add food button' do
      visit new_user_session_path
      fill_in 'email', with: 'user1@mail.com'
      fill_in 'password', with: '111111'
      click_button 'Log in'
      click_link 'My Ingredients'
      expect(page).to have_link('Add food')
    end
  end

  describe 'when I click' do
    it 'On Add food list, it redirects me to shopping list page' do
      visit new_user_session_path
      fill_in 'email', with: 'user1@mail.com'
      fill_in 'password', with: '111111'
      click_button 'Log in'
      click_link 'My Ingredients'
      click_link 'Add food'
      expect(page).to have_content('Food')
      expect(page).to have_content('Measurement unit')
      expect(page).to have_content('Price')
    end
  end
end

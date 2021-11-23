require 'rails_helper'

RSpec.describe 'in user food index page', js: true, type: :system do
  before(:all) do
    user1 = User.create({ name: 'Mario', email: 'user1@mail.com', password: '111111', confirmed_at: '2021-01-01' })
    group1 = Group.create({ name: 'Food', created_at: '2021-01-01', updated_at: '2021-01-01', user_id: user1.id })
    group2 = Group.create({ name: 'Transportation', created_at: '2021-01-01', updated_at: '2021-01-01', user_id: user1.id })
    group3 = Group.create({ name: 'Amenities', created_at: '2021-01-01', updated_at: '2021-01-01', user_id: user1.id })
    transaction1 = Entity.create({ name: 'Mc Donalds combo', created_at: '2021-01-01', updated_at: '2021-01-01', user_id: user1.id, amount: 15.90 })
    transaction2 = Entity.create({ name: 'KFC combo', created_at: '2021-01-01', updated_at: '2021-01-01', user_id: user1.id, amount: 17.90 })
    transaction3 = Entity.create({ name: 'Subway sandwich', created_at: '2021-01-01', updated_at: '2021-01-01', user_id: user1.id, amount: 12.90 })
    transaction4 = Entity.create({ name: 'Train Ticket', created_at: '2021-01-01', updated_at: '2021-01-01', user_id: user1.id, amount: 4.35 })
    transaction5 = Entity.create({ name: 'Car gasoline', created_at: '2021-01-01', updated_at: '2021-01-01', user_id: user1.id, amount: 80.78 })
    transaction6 = Entity.create({ name: 'Motorbike Ride', created_at: '2021-01-01', updated_at: '2021-01-01', user_id: user1.id, amount: 15.20 })
    transaction7 = Entity.create({ name: 'Ice cream at the park', created_at: '2021-01-01', updated_at: '2021-01-01', user_id: user1.id, amount: 4.90 })
    transaction8 = Entity.create({ name: 'Baloons for my kid', created_at: '2021-01-01', updated_at: '2021-01-01', user_id: user1.id, amount: 1.50 })
    transaction9 = Entity.create({ name: 'Street pop corn', created_at: '2021-01-01', updated_at: '2021-01-01', user_id: user1.id, amount: 3.50 })
    GroupEntity.create({ created_at: '2021-01-01', updated_at: '2021-01-01', group_id: group1.id, entity_id: transaction1.id })
    GroupEntity.create({ created_at: '2021-01-01', updated_at: '2021-01-01', group_id: group1.id, entity_id: transaction2.id })
    GroupEntity.create({ created_at: '2021-01-01', updated_at: '2021-01-01', group_id: group1.id, entity_id: transaction3.id })
    GroupEntity.create({ created_at: '2021-01-01', updated_at: '2021-01-01', group_id: group1.id, entity_id: transaction7.id })
    GroupEntity.create({ created_at: '2021-01-01', updated_at: '2021-01-01', group_id: group1.id, entity_id: transaction9.id })
    GroupEntity.create({ created_at: '2021-01-01', updated_at: '2021-01-01', group_id: group2.id, entity_id: transaction4.id })
    GroupEntity.create({ created_at: '2021-01-01', updated_at: '2021-01-01', group_id: group2.id, entity_id: transaction5.id })
    GroupEntity.create({ created_at: '2021-01-01', updated_at: '2021-01-01', group_id: group2.id, entity_id: transaction6.id })
    GroupEntity.create({ created_at: '2021-01-01', updated_at: '2021-01-01', group_id: group3.id, entity_id: transaction6.id })
    GroupEntity.create({ created_at: '2021-01-01', updated_at: '2021-01-01', group_id: group3.id, entity_id: transaction7.id })
    GroupEntity.create({ created_at: '2021-01-01', updated_at: '2021-01-01', group_id: group3.id, entity_id: transaction8.id })
    GroupEntity.create({ created_at: '2021-01-01', updated_at: '2021-01-01', group_id: group3.id, entity_id: transaction9.id })
  end

  describe 'I can see' do
    it 'the splash screen' do
        visit splash_show_path
        expect(page).to have_link('Log in')
        expect(page).to have_link('Sign up')
    end

    it 'the category links' do
        visit splash_show_path
        click_link 'Log in'
        fill_in 'E-mail', with: 'user1@mail.com'
        fill_in 'Password', with: '111111'
        click_button 'Log in'
        expect(page).to have_selector(:css, 'a[href="/entities/show/1"]')
    end

    it 'a category link with food header' do
        visit splash_show_path
        click_link 'Log in'
        fill_in 'E-mail', with: 'user1@mail.com'
        fill_in 'Password', with: '111111'
        click_button 'Log in'
        expect(page).to have_selector(:css, 'a[href="/entities/show/1"]')
    end

    it 'a page with the transactions from a category' do
        visit splash_show_path
        click_link 'Log in'
        fill_in 'E-mail', with: 'user1@mail.com'
        fill_in 'Password', with: '111111'
        click_button 'Log in'
        click_link 'Food'
        expect(page).to have_content('Mc Donalds combo: $15.9')
    end

    it 'a page with the transactions from a category' do
        visit splash_show_path
        click_link 'Log in'
        fill_in 'E-mail', with: 'user1@mail.com'
        fill_in 'Password', with: '111111'
        click_button 'Log in'
        click_link 'Food'
        click_link 'NEW TRANSACTION'
        expect(page).to have_content('Choose category (At least one):')
    end

    it 'a page with the new transaction added on the respective category' do
        visit splash_show_path
        click_link 'Log in'
        fill_in 'E-mail', with: 'user1@mail.com'
        fill_in 'Password', with: '111111'
        click_button 'Log in'
        click_link 'Food'
        click_link 'NEW TRANSACTION'
        fill_in 'Name', with: 'New transaction'
        fill_in 'Amount', with: 105.50
        find(:css, "#entity_food[value='1']").set(true)
        click_button 'ADD TRANSACTION'
        expect(page).to have_content('New transaction')
    end
  end
end

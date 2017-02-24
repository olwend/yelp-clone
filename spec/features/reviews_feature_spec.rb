require 'rails_helper'

feature 'reviewing' do

  scenario 'allows user to leave a review' do
    create_restaurant
    click_link 'Review KFC'
    fill_in "Thoughts", with: "so so"
    select '3', from: 'Rating'
    click_button 'Leave Review'

    expect(current_path).to eq '/restaurants'
    expect(page).to have_content('so so')
  end

scenario 'allows users to leave one review per restaurant only' do

  user = User.create(email: "test@test.com", password: "testtest")
   Restaurant.create(name: 'KFC', user_id: user.id)

  visit '/'
   click_link('Sign in')
   fill_in('Email', with: 'test@test.com')
   fill_in('Password', with: 'testtest')
   click_button("Log in")

   click_link 'Review KFC'
   fill_in "Thoughts", with: "so so"
   select '3', from: 'Rating'
   click_button 'Leave Review'

   click_link 'Review KFC'
   fill_in "Thoughts", with: "amazing"
   select '4', from: 'Rating'
   click_button 'Leave Review'

   expect(current_path).to eq '/restaurants'
   expect(page).to have_content 'You have already reviewed this restaurant'

  end
end

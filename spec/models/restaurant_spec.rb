require 'rails_helper'

describe Restaurant, type: :model do
  it 'is not valid with a name of less than three characters' do
    user = User.create(email: "test@test.com", password: "testtest")
    restaurant = Restaurant.create(name: "kf", user_id: user.id)
    expect(restaurant).to have(1).error_on(:name)
    expect(restaurant).not_to be_valid
  end

  it "is not valid unless it has a unique name" do
    user = User.create(email: "test@test.com", password: "testtest")
    restaurant = Restaurant.create(name: "Dupe", user_id: user.id)
    restaurant = Restaurant.create(name: "Dupe", user_id: user.id)
    expect(restaurant).not_to be_valid
    expect(restaurant).to have(1).error_on(:name)
  end

it "responds to the build review method" do
    user = User.create(email: "test@test.com", password: "testtest")
    restaurant = Restaurant.create(name: "Moe's Tavern", user_id: user.id)
    expect(restaurant).to respond_to(:build_review).with(2).arguments
  end

it "can edit a restaurant" do
    user = User.create(email: "test@test.com", password: "testtest")
    Restaurant.create(name: "Moe's Tavern", user_id: user.id)
    restaurant = Restaurant.find_by(name: "Moe's Tavern")
    restaurant.update(name: "Joe's Tavern")
    expect(restaurant.name).to eq("Joe's Tavern")
  end

 it "can delete a restaurant" do
    user = User.create(email: "test@test.com", password: "testtest")
    Restaurant.create(name: "Moe's Tavern", user_id: user.id)
    restaurant = Restaurant.find_by(name: "Moe's Tavern")
    restaurant.destroy
    expect(restaurant.destroyed?).to be true
  end
end

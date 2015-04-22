require 'spec_helper'

describe "voting for your favorite celebrity" do
  it "allows a signed-in user to upvote" do
    User.create(:email => 'test@email.com', :password => 'password')
    visit '/'
    fill_in 'Email', :with => 'test@email.com'
    fill_in 'Password', :with => 'password'
    click_on 'Log in'
    Celebrity.create(:name => 'Madonna')
    visit '/celebrities'
    click_button 'Cast your vote!'
    page.should have_content 'You voted for Madonna!'
  end

  it "redirects users who are not signed in to create an account" do
    Celebrity.create(:name => 'Madonna')
    visit '/celebrities'
    click_button 'Cast your vote!'
    page.should have_content 'create an account'
  end
end

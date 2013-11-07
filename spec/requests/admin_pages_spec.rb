require 'spec_helper'

describe "AdminPage", :type => :feature do
  describe "When I visit the Admin page" do
    it "should ask me for authentication" do
      visit admin_path

    end
  end

  describe "When I am logged in and visit the Admin page" do
    it "should let me see the admin dashboard" do
      visit admin_path
      fill_in 'Email', :with => 'operezavina@gmail.com'
      fill_in 'Password', :with => 'prav.76'
      click_link 'Sign in'

    end
  end

end
require 'spec_helper'

describe "Admin dashboard", :type => :feature  do

  subject { page }

  describe "When I visit the Admin page" do
    it "should ask me for authentication" do

      visit admin_path
      fill_in 'Email', :with => 'operezavina@gmail.com'
      fill_in 'Password', :with => 'prav.76'
      click_link 'Sign in'
      expect(page).to have_title("Attendance")

    end



  end

  describe "signin_admin_dashboard" do

    before { visit signin_path }

    describe "with valid information as admin" do
      let(:user) { FactoryGirl.create(:user) }
      before do
        fill_in "Email",    with: user.email.upcase
        fill_in "Password", with: user.password
        click_button "Sign in"
      end


      it { should have_link('Profile',     href: user_path(user)) }
      it { should have_link('Settings',    href: edit_user_path(user)) }
      it { should have_link('Sign out',    href: signout_path) }
      it { should_not have_link('Sign in', href: signin_path) }
      it { should have_link('End day', href: endday_path) }

      it "page has a content" do
        page.has_content?('Admin Dashboard')
        page.has_link?('Manage Users')
        page.has_link?('Manage Projects')
        page.has_link?('Manage Events')

      end


    end


  end



end
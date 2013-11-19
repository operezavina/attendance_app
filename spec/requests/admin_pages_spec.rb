require 'spec_helper'

describe "Admin dashboard", :type => :feature  do

  subject { page }


  describe "signin_admin_dashboard" do
    let(:user) { FactoryGirl.create(:user) }
    before do
      visit admin_path
      fill_in "Email",    with: user.email.upcase
      fill_in "Password", with: user.password
      click_button "Sign in"
    end


    describe "with valid information as admin" do

      it { should have_link('Profile',     href: user_path(user)) }
      it { should have_link('Settings',    href: edit_user_path(user)) }
      it { should have_link('Sign out',    href: signout_path) }
      it { should_not have_link('Sign in', href: signin_path) }
      it { should have_link('End day', href: endday_path) }
      click_link("Manage User")
    end



  end



end
require 'spec_helper'

describe "Verify User" do

  describe "login" do
    before { visit login_path }

    describe "if info invalid" do
      before { click_button "Log in" }
      it { should have_selector('div.alert.alert-error', text: 'Invalid') }
    end

    describe "valid info" do
    	let(:user) { FactoryGirl.create(:user) }
    	before do 
    		fill_in "Email" with: user.email.upcase
    		fill_in "Password" with: user.password
    		click_button "Log In"
    	end
 	  it { should have_selector('title', text: user.name) }
      it { should have_link('Profile', href: user_path(user)) }
      it { should have_link('Sign out', href: signout_path) }
      it { should_not have_link('Sign in', href: signin_path) }
    end
  end
end

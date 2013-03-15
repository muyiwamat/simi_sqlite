require 'spec_helper'

describe "Verify user login information" do
    before { visit root_path }

  describe "if invalid" do
    subject { page }

    before { click_button "Log In" }
      it "login should not be successful" do
        page.should have_selector("div.alert.alert-error", text: 'Oops! Your email/password combination is wrong')
      end
    end

    describe "if valid" do
      subject { page }
      # before { visit root_path }
    
    	let(:user) { FactoryGirl.create(:user) }
    	before do 
    		fill_in "Email", with: user.email.upcase
    		fill_in "Password", with: user.password
    		click_button "Log In"
    	end
 	    
      it { should have_selector('title', text: "Aberdeen Locator | Show User Page") }
      it { should have_selector('h1', text: "Welcome AYO") }
      it { should have_link('Aberdeen Locator') }
      it { should have_link('logout') }
      it { should have_link('Edit Profile') }
    end
end

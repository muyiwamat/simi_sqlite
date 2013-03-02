require 'spec_helper'

describe "Users" do
	subject { page } 	
	describe "Welcome page" do
		it "should have the h1 'Welcome to Aberdeen Search' " do
			visit '/'  
			should have_selector('h1', :text => "Welcome to Aberdeen Search")
		end
		it "should have the title 'Welcome' " do
			visit '/' 
			should have_selector('title', :text => "Aberdeen Locator | Welcome")
		end
	end

	describe "Index page" do
		before { visit users_path }
		it { should have_selector('h1', text: 'All User Page') }
		it { should have_selector('title', text: "Aberdeen Locator | All User Page") }
	end

	describe "Create User page" do
		before { visit new_user_path }
		let(:submit) { "Create Account" }
		it { should have_selector('h1', text: "Create User Account") }
		it { should have_selector('title', text: "Aberdeen Locator | New User Account") }
		describe "with invalid information" do
			it "should not be successful" do
				expect { click_button submit }.not_to change(User, :count)
			end
		end
		describe "with valid information" do
			before do
				fill_in "Email", 		with: "ayodele"
				fill_in "Password", 	with: "ayodele"
				fill_in "Confirmation", with: "ayodele"
				fill_in "Address", 		with: "ROOM 92E Esslemont House" 
				fill_in "Postcode", 	with: "AB24 1WU" #strange dis test is failing...
			end
			it "should be successful" do
				expect { click_button submit }.to change(User, :count).by(1)
			end
		end
	end


	describe "Edit page" do
		let(:user) { FactoryGirl.create(:user) }
		before { visit edit_user_path(user.id) }
		it {page.should have_selector('h1', text: 'Edit User Page') }
		it {page.should have_selector('title', text: 'Aberdeen Locator | Edit User Page') }
	end

	describe "Show page" do
		let(:user) { FactoryGirl.create(:user) }
		it "should have the h1 'Show User Page'" do
			visit user_path(user.id)
			page.should have_selector('h1', :text => 'Show User Page')
		end
		it "should have the title 'Aberdeen Locator Show User Page' " do
			visit user_path(user.id)
			page.should have_selector('title', :text => "Aberdeen Locator | Show User Page")
		end
	end
  it "should have the right links on the layout" do
    visit root_path
    # let(:submit) { "Log In" } #i wld assume there is a way to do this...
    click_link "Create Account" #should have_selector('title', :text => "Student Portal | Welcome")
    # click_link "Log In"
  end
end

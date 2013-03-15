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
		# let(:submit) { "Search" }
		it "should have a search menu" do
			visit '/'
			should have_selector('div.search_bar', text: "" )
			click_button ("Search")
		end
	end

	describe "Index page" do
		before { visit users_path }
		it { should have_selector('h1', text: 'All Users') }
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
				fill_in "Email", 		with: "ayodele@yahoo.com"
				fill_in "Password", 	with: "ayodele"
				fill_in "Confirmation", with: "ayodele"
				fill_in "Address", 		with: "ROOM 92E Esslemont House" 
				fill_in "Postcode", 	with: "AB24 1WU"
				it "should be successful" do
					expect { click_button submit }.to change(User, :count).by(1)
				end
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
		let(:library) { FactoryGirl.create(:library) }
		it "should have the h1 'Show User Page'" do
			visit user_path(user) # OR... visit user_path(user.id)
			page.should have_selector('h1', :text => "Welcome AYO" ) #page.should have_selector('h1', :text => "Welcome #{user.email}" )
		end
		it "should have the title 'Aberdeen Locator Show User Page' " do
			visit user_path(user.id)
			page.should have_selector('title', :text => "Aberdeen Locator | Show User Page")
		end
		it "should have a list of libraries" do
			#if i cld do n.times {} wld b nice to create a list of libraries from my fixtures.
			visit user_path(user)
			page.has_selector?('h3')
			page.has_content?('library')
			page.has_content?("[View on map]") # page should have_link("[View on map]") #need to understand ow 2place test result on browser 2imitate what wld b dere in actuality
		end
	end
end

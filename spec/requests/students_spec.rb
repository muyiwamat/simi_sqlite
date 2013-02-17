require 'spec_helper'

describe "Students" do
	subject { page }
	let(:base_title) { "Student Portal" }
	describe "Welcome page" do
		before { visit root_path }

		it { should have_selector('h1', text: 'Welcome') }
		it { should have_selector('title', :text => "#{base_title}") } #makes test below fail
		it { should_not have_selector('title', :text => "Welcome") }

		# it "should have the h1 'Welcome' " do
		# 	# visit '/welcome' # visit '/' # visit root_path
		# 	page.should have_selector('h1', :text => "Welcome") # page.should have_content('Welcome')
		# end
		# it "should have the base title" do
		# 	page.should have_selector('title', :text => "Student Portal")
		# 	# page.should have_selector('title', :text => "#{base_title}") #makes test below fail
		# end

		# it "should not have a custom page title" do
		# 	visit root_path
		# 	page.should_not have_selector('title', :text => "Welcome")
		# end
	end
	# describe "Edit page" do
	# 	before { visit edit_student_path }
	# 	it "should have the content 'Edit' " do
	# 		page.should have_content('Edit')
	# 	end
	# end
	describe "Index page" do
		before { visit students_path }
		it { should have_selector('h1', text: 'Index') }
		it { should have_selector('title', :text => "#{base_title}") }
	end
	describe "New page" do
		before { visit new_student_path }
		it { should have_selector('h1', :text => "New") }
		it { should have_selector('title', :text => "#{base_title}") }
	end
	# describe "Show page" do
	# 	it "should have the h1 'Show' " do
	# 		visit student_path
	# 		page.should have_selector('h1', :text => 'Show')
	# 	end
	# 	it "should have the title 'Show' " do
	# 		visit student_path
	# 		page.should have_selector('title', :text => "#{base_title} | Show")
	# 	end
	# end
  it "should have the right links on the layout" do
    # visit root_path
    click_link "Sign Up"
    page.should have_selector 'title', :text =>"#{base_title}" # full_title('Welcome')
    # click_link "Sign In"
    # page.should # fill in    # page.should have_selector 'title', :text =>"#{base_title}" # full_title('Welcome')
  end
end


# DEFAULTTTTTTTTTTTTTTTTTTTTTTTTTTTTTS

# describe "Students" do
#   describe "GET /students" do
#     it "works! (now write some real specs)" do
#       # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
#       get students_index_path
#       response.status.should be(200)
#     end
#   end
# end

require 'spec_helper'

describe "Students" do
	# let(:base_title) { "Student Portal" }
	subject { page } 	
	describe "Welcome page" do
		# before { visit root_path }
		it "should have the h1 'Welcome to Student Portal' " do
			visit '/'  # visit '/welcome' # visit root_path
			should have_selector('h1', :text => "Welcome to Student Portal")
		end
		it "should have the title 'Welcome' " do
			visit '/' 
			should have_selector('title', :text => "Student Portal | Welcome")
		end
		#code below wld fail since i am not using d helper module...
		# it "should not have a custom page title" do
		# 	visit root_path
		# 	page.should_not have_selector('title', :text => "Welcome")
		# end
	end
	describe "Edit page" do
		let(:student) { FactoryGirl.create(:student) }
		before { visit edit_student_path(student.id) }
		it {page.should have_selector('h1', text: 'Edit Student Page') }
		it {page.should have_selector('title', text: 'Student Portal | Edit') }
	end
	describe "Index page" do
		before { visit students_path }
		it { should have_selector('h1', text: 'Students Page') }
		it { should have_selector('title', text: "Student Portal | Index") }
	end
	describe "Create Account page" do
		before { visit new_student_path }
		let(:submit) { "Create Account" }
		it { should have_selector('h1', text: "Create Student Account") }
		it { should have_selector('title', text: "Student Portal | New") }
		describe "with invalid informatio" do
			it "should not be successful" do
				expect { click_button submit }.not_to change(Student, :count)
			end
		end

		describe "with valid information" do
			before do
				fill_in "Name", 		with: "Simi"
				fill_in "Student ID", 	with: 51126137 #strange dis test is failing...
				fill_in "Password", 	with: "ayodele"
				fill_in "Confirmation", with: "ayodele"
			end
			it "should be successful" do
				expect { click_button submit }.to change(Student, :count).by(1)
			end
		end
	end
	describe "Show page" do
		let(:student) { FactoryGirl.create(:student) }
		it "should have the h1 'Show'" do
			visit student_path(student.id)
			page.should have_selector('h1', :text => 'Show')
		end
		it "should have the title 'Show' " do
			visit student_path(student.id)
			page.should have_selector('title', :text => "Student Portal | Show")
		end
	end
  it "should have the right links on the layout" do
    visit root_path
    click_link "Sign Up" #should have_selector('title', :text => "Student Portal | Welcome")
    # click_link "Sign In"
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

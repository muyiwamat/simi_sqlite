require 'spec_helper'

describe Student do
	before { @student = Student.new(name: "Simileoluwa", student_id: 12345678, password: "ayodele", password_confirmation: "ayodele") }

	subject { @student }
	it { should respond_to(:name) } #it { @student.should respond_to(:name) }
	it { should respond_to(:student_id) }
	it { should respond_to(:password_digest) }
	it { should respond_to(:password) }
	it { should respond_to(:password_confirmation) }
	it { should respond_to(:authenticate) }


	it { should be_valid }

	describe "when name is not present" do
		before { @student.name = " " }
		it { should_not be_valid } #returns false as my validates ensures dat d name must not b empty(not nil)
	end

	describe "when student_id is not present" do
		before { @student.student_id = " " }
		it { should_not be_valid }
	end
	describe "when student_id is greater" do
		# before { @student.student_id = ("a" * 11).size/length } #dis wld be valid
		before { @student.student_id = 12 }
		it { should_not be_valid }
	end

	describe "when student_id is taken" do
		before do
			@student_with_same_id = @student.dup
			@student_with_same_id.save
		end
		it { should_not be_valid }
	end

	describe "when student_id is not valid" do
		before { @student.student_id = "Ayodele1" }
		it { should_not be_valid}
	end

	describe "when password is not present" do
		before { @student.password = @student.password_confirmation = " " }
		# before { @student.password = " ", @student.password_confirmation = " " } #before { @student.password = " ", @student.password_confirmation = " " }
		it { should_not be_valid }
	end
	describe "when password doesnt match confirmation" do
		before { @student.password_confirmation = "mismatch" }
		it { should_not be_valid }
	end

	describe "when password confirmation is nil" do
		before { @student.password_confirmation = nil }
		it { should_not be_valid }
	end

	describe " return value of authenticate method" do
		before { @student.save }
		let(:found_student) { Student.find_by_student_id(@student.student_id) }

		describe "with valid password" do
			it { should == found_student.authenticate(@student.password) }
		end

		describe "with invalid password" do
			let(:student_invalid_password) { found_student.authenticate("invalid") }
			it { should_not == student_invalid_password }
			specify { student_invalid_password.should be_false }
		end
	end

	describe "when password is too short" do
		before { @student.password = @student.password_confirmation = "a" * 6 }
		it { should be_invalid }
	end
end

require 'spec_helper'

describe User do
	before { @user = User.new(email: "ayodele@yahoo.com", password: "ayodele", password_confirmation: "ayodele", address: "ROOM 92E Esslemont House", postcode: "AB24 1WU") }

	subject { @user }
	it { should respond_to(:email) } #it { @student.should respond_to(:name) }
	it { should respond_to(:password_digest) }
	it { should respond_to(:password) }
	it { should respond_to(:password_confirmation) }
	it { should respond_to(:address) }
	it { should respond_to(:postcode) }
	it { should respond_to(:authenticate) }


	it { should be_valid }

	describe "when email is not present" do
		before { @user.email = " " }
		it { should_not be_valid } #returns false as my validates ensures dat d name email not b empty(not nil)
	end

	describe "when email is taken" do
		before do
			@user_with_same_id = @user.dup
			@user_with_same_id.save
		end
		it { should_not be_valid }
	end

	describe "when user email" do
		it "should be invalid" do
			addresses = %w[user@foo,com user_at_foo.org example.user@foo.
                     foo@bar_baz.com foo@bar+baz.com]
            addresses.each do |address|
            	@user.email = address
            	@user.should_not be_valid
            end
		end
		it "should be valid" do
			addresses = %w[user@foo.com A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn]
            addresses.each do |address|
            	@user.email = address
            	@user.should be_valid
            end
		end
	end

	describe "when password is not present" do
		before { @user.password = @user.password_confirmation = " " } # before { @user.password = " ", @user.password_confirmation = " " } #before { @user.password = " ", @user.password_confirmation = " " }
		it { should_not be_valid }
	end
	describe "when password doesnt match confirmation" do
		before { @user.password_confirmation = "mismatch" }
		it { should_not be_valid }
	end

	describe "when password confirmation is nil" do
		before { @user.password_confirmation = nil }
		it { should_not be_valid }
	end

	describe "when password is too short" do
		before { @user.password = @user.password_confirmation = "a" * 6 }
		it { should be_invalid }
	end

	describe "when postcode is not present" do
		before { @user.postcode = " " }
		it { should_not be_valid }
	end

	describe "when postcode" do
		it "should be invalid" do
			postcodes = %w[11241WU 11241wu ab1wu AB241 ba2410w BA2410W]
			postcodes.each do |p|
				@user.postcode = p
				@user.should_not be_valid
			end
		end
		it "should be valid" do
			# postcodes = %w[AB241WU ab241wu 'AB24 1EU' 'AB24 1wu' 'ab24 1WU' ab241WU]
			postcodes = ["AB241WU", "ab241wu", "AB24 1EU", "AB24 1wu", "ab24 1WU", "ab241WU"]
			postcodes.each do |p|
				@user.postcode = p
				@user.should be_valid
			end		
		end
	end

	describe "return value of authenticate method" do
		before { @user.save }
		let(:found_user) { User.find_by_user_id(@user.user_id) }

		describe "with valid password" do
			it { should == found_user.authenticate(@user.password) }
		end
		describe "with invalid password" do
			let(:user_invalid_password) { found_user.authenticate("invalid") }
			it { should_not == user_invalid_password }
			specify { user_invalid_password.should be_false }
		end
	end
end

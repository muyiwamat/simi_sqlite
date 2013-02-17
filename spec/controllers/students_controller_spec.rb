require 'spec_helper'

describe StudentsController do
  # before { @student = Student.new(name: "Simileoluwa", student_id: 12345678, password: "ayodele", password_confirmation: "ayodele") }
  let(:student) { FactoryGirl.create(:student) }

  describe "GET 'new'" do
    it "returns http success" do
      get 'new'
      response.should be_success
    end
  end

  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      response.should be_success
    end
  end

  describe "GET 'welcome'" do
    it "returns http success" do
      get 'welcome'
      response.should be_success
    end
  end

  describe "GET 'show'" do
    let(:student) { FactoryGirl.create(:student) }
    it "returns http success" do
      # get 'show'
      visit student_path(student.id)
      response.should be_success
    end
  end

  describe "GET 'edit'" do
    let(:student) { FactoryGirl.create(:student) }
    it "returns http success" do
      visit student_path(student.id)
      # get 'edit'
      response.should be_success
    end
  end

end

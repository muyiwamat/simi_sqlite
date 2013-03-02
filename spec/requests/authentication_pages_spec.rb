require 'spec_helper'

describe "Verify User" do

  describe "login" do
    before { visit login_path }

    describe "if info invalid" do
      before { click_button "Log in" }
      it { should have_selector('div.alert.alert-error', text: 'Invalid') }
    end
    
  end
end

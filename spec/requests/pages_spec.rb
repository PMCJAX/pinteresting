require 'spec_helper'

describe "Pages" do
  describe "Home page" do
  	it "should_have the content 'Welcome'" do
  		visit root_path
  		expect(page).to have_content('Welcome')
  	end

  	it "should_have the title 'Home'" do
  		visit root_path
  		expect(page).to have_title('Home')
  	end

    describe "for users not logged in" do
      
      it "should have link 'Sign Up'" do
        visit root_path 
        expect(page).to have_link('Login')
      end
    end  
  end

  describe "About page" do
  	it "should_have the content 'About'" do
  		visit about_path
  		expect(page).to have_content('About')
  	end

  	it "should_have the title 'About'" do
  		visit about_path
  		expect(page).to have_title('About')
  	end
  end
end

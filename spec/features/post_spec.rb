require 'rails_helper'

describe 'navigate' do

  describe 'index' do
    it 'can be reached successfully' do
        visit posts_path
        expect(page.status_code).to eq(200)
    end

    it 'has a title of Posts ' do
      visit posts_path
      expect(page).to have_content(/Posts/)
    end
  end

  describe 'creation' do
    let(:password) { Faker::Cannabis.strain }
    let(:email) { Faker::Internet.email }

    before do 
      user  = User.create(email: email, password: password, password_confirmation: password, first_name: Faker::Name.name, last_name: Faker::Name.name)
      login_as(user, :scope => :user)
      visit new_post_path
    end
    
    it 'has a new form that can be reached' do
      expect(page.status_code).to eq(200)
    end

    it 'can be created from new form page' do
      fill_in 'post[date]', with: Date.today
      fill_in 'post[rationale]', with: "User_Association"
      click_on "Save"

      expect(User.last.posts.last.rationale).to eq("User_Association")
    end
  end
end
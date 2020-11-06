require 'rails_helper'

RSpec.describe User, type: :model do
    let(:password) { Faker::Cannabis.strain }
    let(:email) { Faker::Internet.email }
    describe "creation" do
        before do
            @user  = User.create(email: email, password: password, password_confirmation: password, first_name: Faker::Name.name, last_name: Faker::Name.name)
        end
        it "can be created" do
            expect(@user).to be_valid
        end

        it "cannot be creare without first_name or last_name" do
            @user.first_name = nil
            @user.last_name = nil
            expect(@user).to_not be_valid
        end    
    end
end
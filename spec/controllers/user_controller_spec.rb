require 'rails_helper'

RSpec.describe UserController, :type => :controller do

  let(:user) do
    u = User.create(:email => 'cj@matc.edu',
                    :password => 'P@ssw0rd!',
                    :password_confirmation => 'P@ssw0rd!',
                    :first_name => 'CJ')
    return u
  end

  describe "GET show" do
    it 'fetches the user' do
      get :show, {:id => user.id}
      expect(assigns(:user)).to eql user
    end
  end

  describe "GET edit" do
    it "returns http success" do
      get :edit, {:id => user.id}
      expect(assigns(:user)).to eql user
    end
  end

  describe "PUT update" do
    it "returns http success" do
      put :update, {:id => user.id, :user => {:first_name => 'Homer'}}
      user.reload
      expect(user.first_name).to eql 'Homer' 
    end
  end

end

require 'rails_helper'

RSpec.describe User, :type => :model do
  subject { User.new(first_name: 'Homer', 
                     last_name: 'Simpson', 
                     email: 'homer@simpsons.com',
                     password: 'P@ssw0rd!',
                     password_confirmation: 'P@ssw0rd!') }

  describe 'public' do
    it { should respond_to(:first_name) }
    it { should respond_to(:last_name) }
    it { should respond_to(:email) }
    it { should respond_to(:password_digest) }
    it { should respond_to(:password) }
    it { should respond_to(:password_confirmation) }
    it { should respond_to(:authenticate) }
  end

  describe 'validations' do
    it 'requires a first_name to be set' do
      subject.first_name = nil
      expect(subject.valid?).to be_falsey
    end

    it 'requires an email address to be set' do
      subject.email = nil
      expect(subject.valid?).to be_falsey
    end
  end

  describe 'authentication' do
    before { subject.save }
    let(:found_user) { User.find(subject.id) }
    it 'is successful with a valid password' do
      expect(found_user.authenticate(subject.password)).to be_truthy
    end
    it 'is not successful with an invalid password' do
      expect(found_user.authenticate('HORRIBLEPASSWORD')).to be_falsey
    end
  end
end

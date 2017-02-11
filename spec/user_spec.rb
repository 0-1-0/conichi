require "spec_helper"

RSpec.describe User, :type => :model do
    it 'does not create user with short password' do
        expect { User.create! email: 'test@test.com', name: 'username', password: 'test', password_confirmation: 'test' }.to raise_error ActiveRecord::RecordInvalid
    end
end
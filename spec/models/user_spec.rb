require 'rails_helper'

RSpec.describe User, type: :model do
  context 'validation tests' do
    it 'all success' do
      user = User.new(name: 'testname', email: 'qwe@qwe.com', password:'qweqwe').save
      expect(user).to eq(true)
    end
    it 'name is null' do
      user = User.new(email: 'qwe@qwe.com', password:'qweqwe').save
      expect(user).to eq(false)
    end
    it 'email is null' do
      user = User.new(name: 'testname', password:'qweqwe').save
      expect(user).to eq(false)
    end
    it 'password is null' do
      user = User.new(name: 'testname', email: 'qwe@qwe.com').save
      expect(user).to eq(false)
    end
  end
  
end

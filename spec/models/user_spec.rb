require 'rails_helper'

RSpec.describe User, type: :model do
  it 'can new User' do   
    @user = User.new( 
      user_id: "John",
      password: "aaa",
      password_confirmation: "aaa"
    )
    expect(@user).to be_valid
  end

  it 'can authenticate' do   
    @user = User.new( 
      user_id: "John",
      password: "aaa",
      password_confirmation: "aaa"
    )
    expect(@user.authenticate("aaa")).to be_truthy
  end

  it 'can not authenticate' do   
    @user = User.new( 
      user_id: "John",
      password: "aaa",
      password_confirmation: "aaa"
    )
    expect(@user.authenticate("bbb")).to be false
  end
end

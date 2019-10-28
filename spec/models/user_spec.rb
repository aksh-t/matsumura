require 'rails_helper'

RSpec.describe User, type: :model do
  it 'can new User' do   
    @user = User.new( 
      user_id: "John"
    )
    expect(@user).to be_truthy
  end
end

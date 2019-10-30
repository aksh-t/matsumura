# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::V1::UsersController, type: :controller do
  describe 'GET #show' do
    let(:user) { User.create(user_id: "hoge", password: "fuga", password_confirmation: "fuga") }
    before { get :show, params: { id: user.id }, session: {} }
  
    it 'has a 200 status code' do
      expect(response).to have_http_status(:ok)
    end
  end
end

# frozen_string_literal: true

module Api
  module V1
    class UsersController < ApplicationController

      def index
        users = User.order(created_at: :desc)
        render json: { status: 'SUCCESS', message: 'Loaded users', data: users }
      end

      def show
        user = User.find(params[:id])
        render json: { status: 'SUCCESS', message: 'Loaded the user', data: user }
      end

      def create
        user = User.new(post_params)
        if user.save
          render json: { status: 'SUCCESS', data: user }
        else
          render json: { status: 'ERROR', data: user.errors }
        end
      end

      def destroy
        user = User.find(params[:id])
        user.destroy
        render json: { status: 'SUCCESS', message: 'Deleted the user', data: user }
      end

      def update
        user = User.find(params[:id])
        if user.update(post_params)
          render json: { status: 'SUCCESS', message: 'Updated the user', data: user }
        else
          render json: { status: 'SUCCESS', message: 'Not updated', data: user.errors }
        end
      end
    end
  end
end

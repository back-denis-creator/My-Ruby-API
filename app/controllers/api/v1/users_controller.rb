module Api
    module V1
        class UsersController < ApplicationController

            def index
                user = User.order('created_at DESC');
                render json: {status: 'SUCCESS', message: 'Loaded users', data: user}, status: :ok
            end

            def show
                user = User.find(params[:id])
                render json: {status: 'SUCCESS', message: 'Loaded user', data: user}, status: :ok
            end

            def create
                user = User.new(user_params)
                if user.save
                    render json: {status: 'SUCCESS', message: 'Saved user', data: user}, status: :ok 
                else
                    render json: {status: 'ERROR', message: 'User not saved', data: user.errors}, status: :unprocessable_entity
                end 
            end

            def destroy
                user = User.find(params[:id])
                user.destroy
                render json: {status: 'SUCCESS', message: 'Deleted user', data: user}, status: :ok
            end

            def update
                user = User.find(params[:id])
                if user.update(user_params)
                    render json: {status: 'SUCCESS', message: 'Updated user', data: user}, status: :ok 
                else
                    render json: {status: 'ERROR', message: 'User not updated', data: user.errors}, status: :unprocessable_entity
                end

            end

            def programs
                programs = User.find(params[:id]).programs
                render json: {status: 'SUCCESS', message: 'Programs for User ID: ' + params[:id].to_s, data: programs}, status: :ok
            end
        
            private

            def user_params
                params.permit(:name, :email)
            end
        end
    end
end
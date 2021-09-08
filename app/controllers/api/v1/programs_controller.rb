module Api
    module V1
        class ProgramsController < ApplicationController

            def index
                programs = Program.order('created_at DESC');
                render json: {status: 'SUCCESS', message: 'Loaded programs', data: programs}, status: :ok
            end

            def show
                program = Program.find(params[:id])
                render json: {status: 'SUCCESS', message: 'Loaded program', data: program}, status: :ok
            end

            def create
                program = Program.new(program_params)
                if program.save
                    render json: {status: 'SUCCESS', message: 'Saved program', data: program}, status: :ok 
                else
                    render json: {status: 'ERROR', message: 'Program not saved', data: program.errors}, status: :unprocessable_entity
                end 
            end

            def destroy
                program = Program.find(params[:id])
                program.destroy
                render json: {status: 'SUCCESS', message: 'Deleted program', data: program}, status: :ok
            end
            
            def update
                program = Program.find(params[:id])
                if program.update(program_params)
                    render json: {status: 'SUCCESS', message: 'Updated program', data: program}, status: :ok 
                else
                    render json: {status: 'ERROR', message: 'Program not updated', data: program.errors}, status: :unprocessable_entity
                end
            end

            def search
                program = Program.search(params[:term])
                render json: {status: 'SUCCESS', message: 'Searched product', data: program}, status: :ok 
            end

        
            private

            def program_params
                params.permit(:title, :description)
            end
        end
    end
end
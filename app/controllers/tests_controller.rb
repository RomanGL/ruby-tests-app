require_relative '../models/test'

class TestsController < ApplicationController
    def index
        @tests = Test.all
    end

    def new
    end

    def create
        @test = Test.new(test_params)

        @test.save
        redirect_to @test
    end

    def show
        @test = Test.find(params[:id])
    end

    def destroy
        @test = Test.find(params[:id])
        @test.destroy
      
        redirect_to tests_path
      end

    private

    def test_params
        params.require(:test)
              .permit(:title, :description)
    end    
end

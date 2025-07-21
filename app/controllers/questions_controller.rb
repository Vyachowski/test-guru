class QuestionsController < ApplicationController
  before_action :find_test

  def index
    render json: @test.questions
  end

  def find_test
    @test = Test.find(params[:test_id])
  end
end

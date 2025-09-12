class QuestionsController < ApplicationController
  def show
    @test = Test.find(params[:test_id])
    @question = Question.find(params[:id])
  end
end

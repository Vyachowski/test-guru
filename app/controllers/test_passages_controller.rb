class TestPassagesController < ApplicationController
  before_action :set_test_passage, only: %i[show update result]

  def show; end

  def result; end

  def update
    @test_passage.accept!(params[:answer_ids]) unless @test_passage.timed_out?

    redirect_to(@test_passage.completed? ? result_test_passage_path(@test_passage) : test_passage_path(@test_passage))
  end

  private

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end
end

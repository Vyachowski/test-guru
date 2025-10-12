class TestPassagesController < ApplicationController
  before_action :set_test_passage, only: %i[show update result]

  def show; end

  def result; end

  def update
    @test_passage.accept!(params[:answer_ids])

    if @test_passage.completed?
      new_badges = BadgeService.new(@test_passage.user, @test_passage).call

      flash[:notice] = "Вы получили новый бэйдж: #{new_badges.map(&:name).join(', ')}" if new_badges.any?

      redirect_to result_test_passage_path(@test_passage)
    else
      redirect_to test_passage_path(@test_passage)
    end
  end

  private

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end
end

class TestsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found

  before_action :authenticate_user!
  before_action :set_test, only: %i[start]

  def index
    @tests = Test.all

    @badges = Badge.all
    @user_badges = current_user.badges

    @badge_status = @badges.each_with_object({}) do |badge, hash|
      earned = @user_badges.include?(badge)
      hash[badge] = { earned: earned, active: badge.active }
    end
  end

  def start
    @test_passage = current_user.test_passages.create!(test: @test, correct_questions: 0)

    redirect_to test_passage_path(@test_passage)
  end

  private

  def set_test
    @test = Test.find(params[:id])
  end
end

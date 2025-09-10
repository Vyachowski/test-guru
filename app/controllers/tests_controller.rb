class TestsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found

  before_action :authenticate_user!
  before_action :set_test, only: %i[start]

  def index
    @tests = Test.all
  end

  def start
    current_user.tests.push(@test)
    redirect_to current_user.test_passage(@test)
  end

  private

  def set_test
    @test = Test.find(params[:id])
  end
end

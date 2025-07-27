class TestsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found

  before_action :set_test, only: [:index, :new, :create]
  before_action :set_question, only: [:show, :destroy]

  def index
  end

  def show
  end

  def new
  end

  def edit
  end

  def create
  end

  def update
  end

  def destroy
  end

  private

  def set_test
    @test = Test.find(params[:test_id])
  end

  def set_question
    @question = Question.find(params[:id])
  end

  def render_not_found
    render json: { error: "Record not found" }, status: :not_found
  end
end

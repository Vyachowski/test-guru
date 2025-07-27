class TestsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found

  before_action :set_test, only: [:show, :edit, :update, :destroy]

  def index
    @tests = Test.all
  end

  def show; end

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
    @test = Test.find(params[:id])
  end

  def render_not_found
    render json: { error: "Record not found" }, status: :not_found
  end
end

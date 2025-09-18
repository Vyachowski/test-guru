class TestPassagesController < ApplicationController
  before_action :set_test_passage, only: %i[show update result gist]

  def show; end

  def result; end

  def update
    @test_passage.accept!(params[:answer_ids])

    if @test_passage.completed?
      redirect_to result_test_passage_path(@test_passage)
    else
      redirect_to test_passage_path(@test_passage)
    end
  end

  def gist
    result = GistQuestionService.new(@test_passage.current_question).call
    response_body = JSON.parse(result.env.response_body)
    gist_url = response_body["html_url"]
    question_body = @test_passage.current_question.body

    new_gist = Gist.create(question: question_body, url: gist_url, user: current_user)

    if result.success? && new_gist.persisted?
      flash_options = { notice: t(".success") }
    else
      flash_options = { alert: t(".failure") }
    end

    redirect_to @test_passage, **flash_options
  end


  private

  def set_test_passage
    @test_passage = TestPassage.find(params[:test_passage_id] || params[:id])
  end
end

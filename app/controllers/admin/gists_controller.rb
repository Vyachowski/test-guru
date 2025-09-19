class Admin::GistsController < Admin::BaseController
  def index
    @gists = Gist.all
  end

  def show
    @gist = Gist.find(params[:id])
  end

  def create
    @test_passage = TestPassage.find(params[:test_passage_id])

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
end

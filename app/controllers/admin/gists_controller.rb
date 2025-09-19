class Admin::GistsController < Admin::BaseController
  def index
    @gists = Gist.all
  end

  def show
    @gist = Gist.find(params[:id])
  end

  def create
    @test_passage = TestPassage.find(params[:test_passage_id])

    success = GistQuestionService.new(@test_passage.current_question, user: current_user).call

    if success
      flash_options = { notice: t(".success") }
    else
      flash_options = { alert: t(".failure") }
    end

    redirect_to @test_passage, **flash_options
  end
end

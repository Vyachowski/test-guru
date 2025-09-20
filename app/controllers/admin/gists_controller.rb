class Admin::GistsController < Admin::BaseController
  skip_before_action :admin_required!, only: [:create]

  def index
    @gists = Gist.all
  end

  def show
    @gist = Gist.find(params[:id])
  end

  def create
    @test_passage = TestPassage.find(params[:test_passage_id])

    result = GistQuestionService.new(@test_passage.current_question, user: current_user).call

    flash_options = if result.success?
      { notice: t(".success", link: result.gist.url) }
    else
      { alert: t(".failure") }
    end

    redirect_to @test_passage, **flash_options
  end
end

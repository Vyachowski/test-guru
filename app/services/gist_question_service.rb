class GistQuestionService
  attr_accessor :success

  def initialize(question,  user:, client: nil)
    @question = question
    @test = @question.test
    @user = user
    @client = client || GitHubClient.new
  end

  def call
    response = @client.create_gist(gist_params)

    new_gist = Gist.create(question: @question.body, url: response.html_url, user: @user)

    new_gist.persisted?
  rescue Octokit::Error
    false
  end

  private

  def gist_params
    {
      description: I18n.t(
        "test_passages.gist.description",
        title: @test.title
      ),
      files: {
        "test-guru-question.txt" => {
          content: gist_content
        }
      }
    }
  end

  def gist_content
    [@question.body, *@question.answers.pluck(:body)].join("\n")
  end
end

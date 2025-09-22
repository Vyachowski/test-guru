class GistQuestionService
  Result = Struct.new(:success?, :gist)

  def initialize(question,  user:, client: nil)
    @question = question
    @test = @question.test
    @user = user
    @client = client || Octokit::Client.new(access_token: git_token)
  end

  def call
    response = create_gist(gist_params)

    if response
      new_gist = Gist.create(
        question: @question.body,
        url: response.html_url,
        user: @user
      )

      Result.new(new_gist.persisted?, new_gist)
    else
      Result.new(false, nil)
    end
  end

  private

  def create_gist(params)
    response = @client.create_gist(params)

    if response&.id && response&.html_url
      response
    else
      nil
    end
  rescue Octokit::Error => e
    Rails.logger.error("Gist creation error: #{e.message}")
    nil
  end

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

  def git_token
    ENV.fetch("GIST_AUTH_TOKEN", Rails.application.credentials.gist_token)
  end
end

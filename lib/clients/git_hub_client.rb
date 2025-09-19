class GitHubClient
  ROOT_ENDPOINT = "https://api.github.com"
  GIST_AUTH_TOKEN = ENV["GIST_AUTH_TOKEN"].presence || Rails.application.credentials.gist_token

  def initialize
    @client = Octokit::Client.new(access_token: GIST_AUTH_TOKEN)
  end

  def create_gist(params)
    @client.create_gist(params)
  end
end

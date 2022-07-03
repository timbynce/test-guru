# frozen_string_literal: true

class GistQuestionService
  HtmlObject = Struct.new(:success?, :html_url)

  def initialize(question, client: network_client)
    @question = question
    @test = @question.test
    @client = client
  end

  def call
    response = @client.create_gist(gist_params)
    HtmlObject.new(response.html_url.present?, response.html_url)
  end

  private

  def network_client
    Octokit::Client.new(access_token: ENV['ACCESS_TOKEN'])
  end

  def gist_params
    {
      description: "A question about #{@test.title} form TEstGuru",
      public: true,
      files: {
        'test-guru-question.txt' => {
          content: gist_content
        }
      }
    }
  end

  def gist_content
    content = [@question.body]
    content += @question.answers.pluck(:body)
    content.join("\n")
  end
end

# frozen_string_literal: true

class GistQuestionService
  HtmlObject = Struct.new(:success?, :html_url)

  def initialize(question, client: network_client)
    @question = question
    @test     = question.test
    @user     = question.author
    @client   = client
  end

  def call
    gist = @user.gists.build(question: @question)
    
    if gist.valid?
      response = @client.create_gist(gist_params)
      
      gist.gist_url = response.html_url
      gist.save

      HtmlObject.new(gist.gist_url.present?, gist.gist_url)
    else
      HtmlObject.new(false)
    end
  end

  private

  def network_client
    Octokit::Client.new(access_token: ENV['GITHUB_ACCESS_TOKEN'])
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
    content = [@question.body, *@question.answers.pluck(:body)].join("\n")
  end
end

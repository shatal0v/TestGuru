# frozen_string_literal: true

class GistQuestionService
  def initialize(question, client: nil)
    @question = question
    @test = @question.test
    @client = client || Octokit::Client.new(access_token: ENV['GIST_ACCESS_TOKEN'])
  end

  def call
    @client.create_gist(gist_params)
  end

  def client_last_response
    @client.last_response
  end

  private

  def gist_params
    {
      description: "#{I18n.t('.about')} #{@test.title} #{I18n.t('.from')} TestGuru",
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

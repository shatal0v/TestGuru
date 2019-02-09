module QuestionsHelper
  def question_header(action)
    case action
    when 'new'
      "Create New #{@test.title} Question"
    when 'edit'
      "Edit #{@question.test.title} Question"
    else
      "Testguru"
    end
  end

  def year_now
    Time.now.year
  end

  def github_url(author, repo)
    "https://github.com/#{author}/#{repo}"
  end
end

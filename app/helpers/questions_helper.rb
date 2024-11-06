module QuestionsHelper
  def question_header(question)
    if question.persisted?
      verb = "Edit"
    else
      verb = "Create"
    end

    "#{verb} #{question.test.title} question"
  end
end

module TestPassagesHelper
  def test_result_message(test_passage)
    if test_passage.success?
      content_tag(:h1, t("test_passages.result.success", rate: @test_passage.test_rate), class: "test-title success")
    else
      content_tag(:h1, t("test_passages.result.fail", rate: @test_passage.test_rate), class: "test-title fail")
    end
  end
end

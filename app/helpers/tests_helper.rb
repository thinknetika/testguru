module TestsHelper
  def test_level(test)
    level = test.level

    case level
    when (0..1).include?(level)
      :easy
    when (2..4).include?(level)
      :medium
    when (5..Float::INFINITY).include?(level)
      :hard
    end
  end
end

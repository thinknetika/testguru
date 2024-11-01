class User < ApplicationRecord

  def tests_by_level(level)
    test_id = TestPassage.where(user_id: id).pluck(:test_id)

    Test.where(id: test_id, level: level)
  end
end

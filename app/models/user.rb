class User < ApplicationRecord
  def tests_by_difficulty(difficulty_level)
    Test.joins("INNER JOIN test_passages ON test_passages.test_id = tests.id")
        .where(test_passages: { user_id: id }, tests: { level: difficulty_level })
  end
end

class User < ApplicationRecord
  def find_by_difficulty_level(difficulty_level)
    test_ids = TestPassage.where(user_id: id).pluck(:test_id)
    Test.where(id: test_ids, level: difficulty_level)
  end
end

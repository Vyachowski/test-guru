class User < ApplicationRecord
  def find_by_difficulty_level(difficulty_level)
    test_ids = TestPassage.where(user_id: id).pluck(:test_id)
    Test.where(id: test_ids, level: difficulty_level)
  end
end

# Результат:
# test-guru(dev)> user = User.find_by(email: 'ivan@example.com')
#   User Load (0.7ms)  SELECT "users".* FROM "users" WHERE "users"."email" = ? LIMIT ?  [["email", "[FILTERED]"], ["LIMIT", 1]]
# =>
# #<User:0x00007f038fbbebc8
# ...
# test-guru(dev)> user.find_by_difficulty_level(1)
#   TestPassage Pluck (0.1ms)  SELECT "test_passages"."test_id" FROM "test_passages" WHERE "test_passages"."user_id" = ?  [["user_id", 1]]
#   Test Load (0.1ms)  SELECT "tests".* FROM "tests" WHERE "tests"."id" IN (?, ?) AND "tests"."level" = ? /* loading for pp */ LIMIT ?  [["id", 1], ["id", 2], ["level", 1], ["LIMIT", 11]]
# =>
# [#<Test:0x00007f038e9e7530
#   id: 1,
#   name: "Frontend Basics",
#   level: 1,
#   category_id: 1,
#   creator_id: 1,
#   created_at: "2025-07-06 16:35:04.337129000 +0300",
#   updated_at: "2025-07-06 16:35:04.337129000 +0300">,
#  #<Test:0x00007f038ea87300
#   id: 2,
#   name: "Backend Basics",
#   level: 1,
#   category_id: 2,
#   creator_id: 1,
#   created_at: "2025-07-06 16:35:04.341563000 +0300",
#   updated_at: "2025-07-06 16:35:04.341563000 +0300">]

class Test < ApplicationRecord
  def self.find_all_by_category_name(category_name)
    joins("INNER JOIN categories ON categories.id = tests.category_id")
      .where(categories: { title: category_name })
      .order(name: :desc)
      .pluck(:name)
  end
end

# test-guru(dev)> Test.find_all_by_category_name(:Frontend)
#   Test Pluck (0.6ms)  SELECT "tests"."name" FROM "tests" INNER JOIN categories ON categories.id = tests.category_id WHERE "categories"."title" = ? ORDER BY "tests"."name" DESC  [["title", "Frontend"]]
# => ["Frontend Intermediate", "Frontend Basics"]

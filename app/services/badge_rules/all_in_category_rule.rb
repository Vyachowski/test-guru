module BadgeRules
  class AllInCategoryRule < BaseRule
    def satisfied?
      category = @test_passage.test.category
      return false unless category.title.casecmp?(@value.to_s)

      category_tests = category.tests.ids
      passed_tests = @user.test_passages.select(&:successful?).pluck(:test_id).uniq
      (category_tests - passed_tests).empty?
    end
  end
end

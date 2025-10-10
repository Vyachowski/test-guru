module BadgeRules
  class AllOfLevelRule < BaseRule
    def satisfied?
      return false unless test_passage.test.level == value.to_i

      level_tests = Test.where(level: value.to_i).ids
      passed_tests = user.test_passages.select(&:successful?).pluck(:test_id).uniq

      (level_tests - passed_tests).empty?
    end
  end
end

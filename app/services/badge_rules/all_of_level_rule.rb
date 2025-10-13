module BadgeRules
  class AllOfLevelRule < BaseRule
    def satisfied?
      return false unless test_passage.test.level.to_i == value.to_i

      level_tests = Test.where(level: value).ids
      passed_tests = user.test_passages.select(&:successful?).pluck(:test_id).uniq
      (level_tests - passed_tests).empty?
    end

    def self.form_field
      { name: :rule_value, type: :select, label: "Уровень" }
    end

    def self.options
      Test.distinct.pluck(:level).sort.map { |l| [l, l] }
    end
  end
end

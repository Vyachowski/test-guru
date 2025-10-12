module BadgeRules
  class PassedOnAttemptRule < BaseRule
    def satisfied?
      attempts_count = user.test_passages.where(test: test_passage.test).count

      test_passage.successful? && attempts_count == rule_value.to_i
    end
  end
end

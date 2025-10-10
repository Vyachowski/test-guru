module BadgeRules
  class FirstTryRule < BaseRule
    def satisfied?
      user.test_passages.where(test: test_passage.test).count == 1 &&
        test_passage.successful?
    end
  end
end

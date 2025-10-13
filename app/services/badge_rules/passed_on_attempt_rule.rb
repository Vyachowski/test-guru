module BadgeRules
  class PassedOnAttemptRule < BaseRule
    def satisfied?
      user.test_passages.where(test: test_passage.test).count == value.to_i &&
        test_passage.successful?
    end

    def self.form_field
      { name: :rule_value, type: :number, label: "Попытка" }
    end
  end
end

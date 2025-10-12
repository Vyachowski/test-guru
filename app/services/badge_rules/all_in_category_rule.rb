module BadgeRules
  class AllInCategoryRule < BaseRule
    def satisfied?
      category = test_passage.test.category
      return false unless category.title == value

      category_tests = category.tests.ids
      passed_tests = user.test_passages.select(&:successful?).pluck(:test_id).uniq
      (category_tests - passed_tests).empty?
    end

    def self.form_field
      { name: :rule_value, type: :select, label: "Категория" }
    end

    def self.options
      Category.all.map { |c| [c.title, c.title] }
    end
  end
end

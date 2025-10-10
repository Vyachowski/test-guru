class BadgeService
  def initialize(user, test_passage)
    @user = user
    @test_passage = test_passage
  end

  def call
    new_badges = []

    Badge.active.find_each do |badge|
      rule_class = "BadgeRules::#{badge.rule_type.camelize}Rule".safe_constantize
      next unless rule_class

      rule = rule_class.new(@user, @test_passage, badge.rule_value)
      if rule.satisfied?
        @user.badges << badge
        new_badges << badge
      end
    end

    new_badges
  end

  private

  def give_badge(badge)
    @user.badges << badge
  end

  def all_in_category?(category_title)
    category = @test_passage.test.category
    return false unless category.title.downcase == category_title.to_s.downcase

    category_tests = category.tests.ids
    passed_tests = @user.test_passages.select(&:successful?).pluck(:test_id).uniq
    (category_tests - passed_tests).empty?
  end

  def first_try?(_value = nil)
    @user.test_passages.where(test: @test_passage.test).count == 1 && @test_passage.successful?
  end

  def all_of_level?(level)
    return false unless @test_passage.test.level == level.to_i

    level_tests = Test.where(level: level).ids
    passed_tests = @user.test_passages.select(&:successful?).pluck(:test_id).uniq
    (level_tests - passed_tests).empty?
  end
end

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
        give_badge(badge)

        new_badges << badge
      end
    end

    new_badges
  end

  private

  def give_badge(badge)
    @user.user_badges.create!(badge: badge)
  end
end

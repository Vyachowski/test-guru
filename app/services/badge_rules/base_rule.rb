module BadgeRules
  class BaseRule
    def initialize(user, test_passage, value)
      @user = user
      @test_passage = test_passage
      @value = value
    end
  end
end

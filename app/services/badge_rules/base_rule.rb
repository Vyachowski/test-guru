module BadgeRules
  class BaseRule
    attr_reader :user, :test_passage, :value

    def initialize(user, test_passage, value)
      @user = user
      @test_passage = test_passage
      @value = value
    end

    def satisfied?
      raise NotImplementedError
    end

    def self.form_field
      nil
    end

    def self.options
      []
    end
  end
end

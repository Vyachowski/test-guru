module TestsHelper
  def test_level(test)
    levels = {
      0 => "easy",
      1 => "elementary",
      2 => "advanced",
      3 => "hard"
    }

    levels.fetch(test.level, "hero")
  end
end

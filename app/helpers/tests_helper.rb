module TestsHelper
  LEVELS = {
    0 => "easy",
    1 => "elementary",
    2 => "advanced",
    3 => "hard"
  }.freeze

  def test_level(test)
    LEVELS.fetch(test.level, "hero")
  end

  def test_header(test)
    test.persisted? ? "Отредактируйте тест #{test.title}" : "Создайте новый тест"
  end
end

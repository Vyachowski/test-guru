module TestsHelper
  def test_level(test)
    levels = {
      0 => "easy",
      1 => "elementary",
      2 => "advanced",
      3 => "hard"
  }.freeze

    levels.fetch(test.level, "hero")
  end

  def test_header(test_title, is_edit_form = false)
    is_edit_form ? "Отредактируйте тест #{test_title}" : "Создайте новый тест"
  end
end

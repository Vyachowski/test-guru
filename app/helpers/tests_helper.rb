module TestsHelper
  def test_level(test)
    I18n.t("helpers.tests.levels.#{test.level}", default: I18n.t("helpers.tests.levels.hero"))
  end

  def test_header(test)
    test.persisted? ? I18n.t("helpers.tests.header.edit", title: test.title) : I18n.t("helpers.tests.header.new")
  end
end

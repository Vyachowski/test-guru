# Создаем тестовые данные

# == Создаем категории и сохраняем хэш с айди для создания тестов
categories = [ 'Frontend', 'Backend', 'Mobile Development', 'DevOps', 'Game Development' ]

category_records = categories.index_with do |title|
  Category.find_or_create_by!(title: title)
end

# == Создаем юзеров и сохраняем хэш с имейлами для создания вопросов
users = [
  { first_name: 'Ivan', last_name: 'Ivanov', email: 'ivan@example.com', password_digest: '$2a$12$clSVugx.w.oGEArQJvPTgezTRqQuw3RvT5OqCvnIlPnLQ9eGLBKom' },
  { first_name: 'Petr', last_name: 'Petrov', email: 'petr@example.com', password_digest: '$2a$12$clSVugx.w.oGEArQJvPTgezTRqQuw3RvT5OqCvnIlPnLQ9eGLBKom' },
  { first_name: 'Svetlana', last_name: 'Svetlanovich', email: 'svetlana@example.com', password_digest: '$2a$12$clSVugx.w.oGEArQJvPTgezTRqQuw3RvT5OqCvnIlPnLQ9eGLBKom' }
]

user_records = users.map do |user|
  [ user[:email], User.find_or_create_by!(email: user[:email]) { |u| u.assign_attributes(user) } ]
end.to_h

# == Создаем тесты и сохраняем хэш с имейлами для создания вопросов
tests = [
  # === Уровень 1 ===
  { name: 'Frontend Basics', level: 1, category_id: category_records['Frontend'].id, creator_id: user_records['ivan@example.com'].id },
  { name: 'Backend Basics', level: 1, category_id: category_records['Backend'].id, creator_id: user_records['ivan@example.com'].id },
  { name: 'Mobile Basics', level: 1, category_id: category_records['Mobile Development'].id, creator_id: user_records['ivan@example.com'].id },
  { name: 'DevOps Basics', level: 1, category_id: category_records['DevOps'].id, creator_id: user_records['ivan@example.com'].id },
  { name: 'Game Development Basics', level: 1, category_id: category_records['Game Development'].id, creator_id: user_records['ivan@example.com'].id },

  # === Уровень 2 ===
  { name: 'Frontend Intermediate', level: 2, category_id: category_records['Frontend'].id, creator_id: user_records['svetlana@example.com'].id },
  { name: 'Backend Intermediate', level: 2, category_id: category_records['Backend'].id, creator_id: user_records['svetlana@example.com'].id },
  { name: 'Mobile Intermediate', level: 2, category_id: category_records['Mobile Development'].id, creator_id: user_records['svetlana@example.com'].id },
  { name: 'DevOps Intermediate', level: 2, category_id: category_records['DevOps'].id, creator_id: user_records['svetlana@example.com'].id },
  { name: 'Game Development Intermediate', level: 2, category_id: category_records['Game Development'].id, creator_id: user_records['svetlana@example.com'].id }
]

test_records = tests.map do |test|
  [ test[:name], Test.find_or_create_by!(name: test[:name]) { |t| t.assign_attributes(test) } ]
end.to_h

# == Создаем вопросы и сохраняем хэш с имейлами для создания вопросов
questions = [
  # === Уровень 1 (базовый) ===

  # Frontend
  { body: 'Что такое HTML и для чего он нужен?', test_id: nil },
  { body: 'Какая роль CSS в веб-разработке?', test_id: nil },
  { body: 'Что такое JavaScript и где он используется?', test_id: nil },

  # Backend
  { body: 'Что такое сервер и какую роль он выполняет?', test_id: nil },
  { body: 'Что такое база данных?', test_id: nil },
  { body: 'Что такое API?', test_id: nil },

  # Mobile Development
  { body: 'Что такое мобильное приложение?', test_id: nil },
  { body: 'Назовите две популярные мобильные операционные системы.', test_id: nil },
  { body: 'Что такое экранное разрешение?', test_id: nil },

  # DevOps
  { body: 'Что такое сервер?', test_id: nil },
  { body: 'Что такое версия ПО (software version)?', test_id: nil },
  { body: 'Что такое резервное копирование данных?', test_id: nil },

  # Game Development
  { body: 'Что такое компьютерная игра?', test_id: nil },
  { body: 'Назовите жанры компьютерных игр.', test_id: nil },
  { body: 'Что такое игровой персонаж (игровой герой)?', test_id: nil },

  # === Уровень 2 (средний) ===

  # Frontend
  { body: 'Что такое виртуальный DOM и как он оптимизирует работу UI?', test_id: nil },
  { body: 'Объясните разницу между блоком, строчным и строчно-блочным элементом в CSS.', test_id: nil },
  { body: 'Как работает event delegation в JavaScript и зачем он нужен?', test_id: nil },

  # Backend
  { body: 'Что такое REST API и какие основные методы HTTP в нем используются?', test_id: nil },
  { body: 'Объясните концепцию middleware в веб-фреймворках.', test_id: nil },
  { body: 'Что такое ORM и как он упрощает работу с базой данных?', test_id: nil },

  # Mobile Development
  { body: 'Чем отличается native разработка от кроссплатформенной?', test_id: nil },
  { body: 'Что такое жизненный цикл активности (Activity) в Android?', test_id: nil },
  { body: 'Объясните паттерн MVVM и его применение в мобильных приложениях.', test_id: nil },

  # DevOps
  { body: 'Что такое контейнеризация и какие преимущества она дает?', test_id: nil },
  { body: 'Объясните принцип работы CI/CD и зачем он нужен.', test_id: nil },
  { body: 'Что такое инфраструктура как код (IaC) и популярные инструменты для ее реализации?', test_id: nil },

  # Game Development
  { body: 'Что такое игровой движок и какие известные движки вы знаете?', test_id: nil },
  { body: 'Объясните разницу между 2D и 3D графикой в играх.', test_id: nil },
  { body: 'Что такое игровой цикл (game loop) и почему он важен?', test_id: nil }
]

question_records = []
questions.each_slice(3).with_index do |question_group, index|
  test = tests[index]
  test_id = test_records[test[:name]].id

  question_group.each do |question|
    question[:test_id] = test_id
    question_records << Question.find_or_create_by!(body: question[:body], test_id: test_id)
  end
end

answers = [
  # === Уровень 1 ===

  # Frontend
  { body: 'Язык разметки для создания веб-страниц', correct: true, question_id: nil },
  { body: 'Язык программирования', correct: false, question_id: nil },
  { body: 'Фреймворк для разработки', correct: false, question_id: nil },
  { body: 'База данных', correct: false, question_id: nil },

  { body: 'Отвечает за внешний вид страницы', correct: true, question_id: nil },
  { body: 'Отвечает за логику сайта', correct: false, question_id: nil },
  { body: 'Язык программирования', correct: false, question_id: nil },
  { body: 'База данных', correct: false, question_id: nil },

  { body: 'Язык программирования для браузера', correct: true, question_id: nil },
  { body: 'Система управления базами данных', correct: false, question_id: nil },
  { body: 'Язык разметки', correct: false, question_id: nil },
  { body: 'Операционная система', correct: false, question_id: nil },

  # Backend
  { body: 'Компьютер, который обрабатывает запросы', correct: true, question_id: nil },
  { body: 'Браузер пользователя', correct: false, question_id: nil },
  { body: 'Язык программирования', correct: false, question_id: nil },
  { body: 'Фреймворк', correct: false, question_id: nil },

  { body: 'Система для хранения данных', correct: true, question_id: nil },
  { body: 'Программа для рисования', correct: false, question_id: nil },
  { body: 'Язык программирования', correct: false, question_id: nil },
  { body: 'Операционная система', correct: false, question_id: nil },

  { body: 'Интерфейс для взаимодействия программ', correct: true, question_id: nil },
  { body: 'Программа для обработки изображений', correct: false, question_id: nil },
  { body: 'Система управления базами данных', correct: false, question_id: nil },
  { body: 'Язык программирования', correct: false, question_id: nil },

  # Mobile Development
  { body: 'Программа для смартфона или планшета', correct: true, question_id: nil },
  { body: 'Операционная система', correct: false, question_id: nil },
  { body: 'Язык программирования', correct: false, question_id: nil },
  { body: 'Веб-сайт', correct: false, question_id: nil },

  { body: 'iOS и Android', correct: true, question_id: nil },
  { body: 'Windows и Linux', correct: false, question_id: nil },
  { body: 'MacOS и Unix', correct: false, question_id: nil },
  { body: 'Java и Kotlin', correct: false, question_id: nil },

  { body: 'Количество пикселей на экране', correct: true, question_id: nil },
  { body: 'Тип батареи', correct: false, question_id: nil },
  { body: 'Процессор устройства', correct: false, question_id: nil },
  { body: 'Версия ОС', correct: false, question_id: nil },

  # DevOps
  { body: 'Компьютер, предоставляющий сервисы', correct: true, question_id: nil },
  { body: 'Программа для создания дизайна', correct: false, question_id: nil },
  { body: 'Язык программирования', correct: false, question_id: nil },
  { body: 'База данных', correct: false, question_id: nil },

  { body: 'Номер версии программного обеспечения', correct: true, question_id: nil },
  { body: 'Дата выпуска устройства', correct: false, question_id: nil },
  { body: 'Название проекта', correct: false, question_id: nil },
  { body: 'Имя пользователя', correct: false, question_id: nil },

  { body: 'Создание копий данных для восстановления', correct: true, question_id: nil },
  { body: 'Удаление файлов', correct: false, question_id: nil },
  { body: 'Изменение дизайна сайта', correct: false, question_id: nil },
  { body: 'Запуск игр', correct: false, question_id: nil },

  # Game Development
  { body: 'Программа для развлечения и взаимодействия', correct: true, question_id: nil },
  { body: 'Операционная система', correct: false, question_id: nil },
  { body: 'Язык программирования', correct: false, question_id: nil },
  { body: 'База данных', correct: false, question_id: nil },

  { body: 'Экшен, РПГ, Стратегия', correct: true, question_id: nil },
  { body: 'HTML, CSS, JavaScript', correct: false, question_id: nil },
  { body: 'Windows, Linux, MacOS', correct: false, question_id: nil },
  { body: 'Сервер, Клиент, Прокси', correct: false, question_id: nil },

  { body: 'Главный герой игры', correct: true, question_id: nil },
  { body: 'Системная ошибка', correct: false, question_id: nil },
  { body: 'Тип файла', correct: false, question_id: nil },
  { body: 'Название компании', correct: false, question_id: nil },

  # === Уровень 2 ===

  # Frontend
  { body: 'Механизм для минимизации изменений в реальном DOM', correct: true, question_id: nil },
  { body: 'Тип базы данных', correct: false, question_id: nil },
  { body: 'Операционная система', correct: false, question_id: nil },
  { body: 'Язык программирования', correct: false, question_id: nil },

  { body: 'Блочные элементы занимают всю ширину, строчные — только содержимое', correct: true, question_id: nil },
  { body: 'Строчные элементы занимают всю ширину, блочные — только содержимое', correct: false, question_id: nil },
  { body: 'Нет разницы', correct: false, question_id: nil },
  { body: 'Это свойства JavaScript', correct: false, question_id: nil },

  { body: 'Обработчик событий добавляется к родителю, чтобы ловить события потомков', correct: true, question_id: nil },
  { body: 'Обработчик событий добавляется ко всем элементам вручную', correct: false, question_id: nil },
  { body: 'Это паттерн для баз данных', correct: false, question_id: nil },
  { body: 'Это тип данных в CSS', correct: false, question_id: nil },

  # Backend
  { body: 'Архитектурный стиль для взаимодействия клиентов и серверов', correct: true, question_id: nil },
  { body: 'Тип компьютера', correct: false, question_id: nil },
  { body: 'Язык программирования', correct: false, question_id: nil },
  { body: 'База данных', correct: false, question_id: nil },

  { body: 'Компонент, обрабатывающий запросы на сервере', correct: true, question_id: nil },
  { body: 'Тип клиента', correct: false, question_id: nil },
  { body: 'Программа для дизайна', correct: false, question_id: nil },
  { body: 'Фреймворк', correct: false, question_id: nil },

  { body: 'Библиотека для работы с базой данных через объекты', correct: true, question_id: nil },
  { body: 'Язык программирования', correct: false, question_id: nil },
  { body: 'Тип сервера', correct: false, question_id: nil },
  { body: 'Операционная система', correct: false, question_id: nil },

  # Mobile Development
  { body: 'Разработка приложений под конкретную платформу', correct: true, question_id: nil },
  { body: 'Универсальный язык программирования', correct: false, question_id: nil },
  { body: 'Веб-сайт', correct: false, question_id: nil },
  { body: 'Операционная система', correct: false, question_id: nil },

  { body: 'Состояния жизненного цикла активности в Android', correct: true, question_id: nil },
  { body: 'Тип процессора', correct: false, question_id: nil },
  { body: 'Вид экрана', correct: false, question_id: nil },
  { body: 'Язык программирования', correct: false, question_id: nil },

  { body: 'Паттерн для разделения UI и логики', correct: true, question_id: nil },
  { body: 'Тип базы данных', correct: false, question_id: nil },
  { body: 'Фреймворк', correct: false, question_id: nil },
  { body: 'Операционная система', correct: false, question_id: nil },

  # DevOps
  { body: 'Изоляция приложений в контейнерах', correct: true, question_id: nil },
  { body: 'Язык программирования', correct: false, question_id: nil },
  { body: 'База данных', correct: false, question_id: nil },
  { body: 'Операционная система', correct: false, question_id: nil },

  { body: 'Автоматизация сборки и деплоя', correct: true, question_id: nil },
  { body: 'Ручное обновление сервера', correct: false, question_id: nil },
  { body: 'Создание резервных копий', correct: false, question_id: nil },
  { body: 'Мониторинг игр', correct: false, question_id: nil },

  { body: 'Управление инфраструктурой с помощью кода', correct: true, question_id: nil },
  { body: 'Ручное администрирование серверов', correct: false, question_id: nil },
  { body: 'Создание игр', correct: false, question_id: nil },
  { body: 'Пользовательский интерфейс', correct: false, question_id: nil },

  # Game Development
  { body: 'Программное обеспечение для создания игр', correct: true, question_id: nil },
  { body: 'База данных', correct: false, question_id: nil },
  { body: 'Операционная система', correct: false, question_id: nil },
  { body: 'Язык программирования', correct: false, question_id: nil },

  { body: '2D — плоская графика, 3D — объёмная', correct: true, question_id: nil },
  { body: '2D — объёмная графика, 3D — плоская', correct: false, question_id: nil },
  { body: 'Операционная система', correct: false, question_id: nil },
  { body: 'Язык программирования', correct: false, question_id: nil },

  { body: 'Основной цикл обработки событий и отрисовки игры', correct: true, question_id: nil },
  { body: 'Тип игрового персонажа', correct: false, question_id: nil },
  { body: 'Формат файла', correct: false, question_id: nil },
  { body: 'Название компании', correct: false, question_id: nil }
]

answer_records = []
answers.each_slice(4).with_index do |answer_group, index|
  question = question_records[index]
  answer_group.each do |answer|
    answer[:question_id] = question.id
    answer_records << Answer.find_or_create_by!(body: answer[:body], question_id: question[:question_id]) do |a|
      a.correct = answer[:correct]
    end
  end
end

test_passages_data = [
  { user_email: 'ivan@example.com', test_name: 'Frontend Basics', passed: true },
  { user_email: 'ivan@example.com', test_name: 'Backend Basics', passed: false },
  { user_email: 'svetlana@example.com', test_name: 'Mobile Basics', passed: true }
]

test_passages_data.each do |tp|
  user = user_records[tp[:user_email]]
  test = test_records[tp[:test_name]]

  TestPassage.find_or_create_by!(user_id: user.id, test_id: test.id) do |tp_record|
    tp_record.passed = tp[:passed]
  end
end

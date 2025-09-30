categories = ['Frontend', 'Backend', 'Mobile Development', 'DevOps', 'Game Development']

category_records = categories.index_with do |title|
  Category.find_or_create_by!(title: title)
end

users = [
  { email: 'user@user.com' },
  { email: 'petr@example.com' },
  { email: 'svetlana@example.com' }
]

user_records = users.map do |user|
  [user[:email], User.find_or_create_by!(email: user[:email]) do |u|
    u.password = "useruser"
    u.password_confirmation = "useruser"
  end]
end.to_h

admin = Admin.find_or_create_by!(email: 'admin@admin.com') do |u|
  u.password = 'adminadmin'
  u.password_confirmation = 'adminadmin'
  u.first_name = 'Admin'
  u.last_name  = 'Admin'
end

user_records['admin@admin.com'] = admin

tests = [
  # === Уровень 1 ===
  { title: 'Frontend Basics', level: 1, category: category_records['Frontend'], creator: admin },
  { title: 'Backend Basics', level: 1, category: category_records['Backend'], creator: admin },
  { title: 'Mobile Basics', level: 1, category: category_records['Mobile Development'], creator: admin },
  { title: 'DevOps Basics', level: 1, category: category_records['DevOps'], creator: admin },
  { title: 'Game Development Basics', level: 1, category: category_records['Game Development'], creator: admin },

  # === Уровень 2 ===
  { title: 'Frontend Intermediate', level: 2, category: category_records['Frontend'], creator: admin },
  { title: 'Backend Intermediate', level: 2, category: category_records['Backend'], creator: admin },
  { title: 'Mobile Intermediate', level: 2, category: category_records['Mobile Development'], creator: admin },
  { title: 'DevOps Intermediate', level: 2, category: category_records['DevOps'], creator: admin },
  { title: 'Game Development Intermediate', level: 2, category: category_records['Game Development'], creator: admin }
]

test_records = tests.map do |test|
  [test[:title], Test.find_or_create_by!(title: test[:title]) { |t| t.assign_attributes(test) }]
end.to_h

questions = [
  # === Уровень 1 (базовый) ===

  # Frontend
  { body: 'Что такое HTML и для чего он нужен?' },
  { body: 'Какая роль CSS в веб-разработке?' },
  { body: 'Что такое JavaScript и где он используется?' },

  # Backend
  { body: 'Что такое сервер и какую роль он выполняет?' },
  { body: 'Что такое база данных?' },
  { body: 'Что такое API?' },

  # Mobile Development
  { body: 'Что такое мобильное приложение?' },
  { body: 'Назовите две популярные мобильные операционные системы.' },
  { body: 'Что такое экранное разрешение?' },

  # DevOps
  { body: 'Что такое сервер?' },
  { body: 'Что такое версия ПО (software version)?' },
  { body: 'Что такое резервное копирование данных?' },

  # Game Development
  { body: 'Что такое компьютерная игра?' },
  { body: 'Назовите жанры компьютерных игр.' },
  { body: 'Что такое игровой персонаж (игровой герой)?' },

  # === Уровень 2 (средний) ===

  # Frontend
  { body: 'Что такое виртуальный DOM и как он оптимизирует работу UI?' },
  { body: 'Объясните разницу между блоком, строчным и строчно-блочным элементом в CSS.' },
  { body: 'Как работает event delegation в JavaScript и зачем он нужен?' },

  # Backend
  { body: 'Что такое REST API и какие основные методы HTTP в нем используются?' },
  { body: 'Объясните концепцию middleware в веб-фреймворках.' },
  { body: 'Что такое ORM и как он упрощает работу с базой данных?' },

  # Mobile Development
  { body: 'Чем отличается native разработка от кроссплатформенной?' },
  { body: 'Что такое жизненный цикл активности (Activity) в Android?' },
  { body: 'Объясните паттерн MVVM и его применение в мобильных приложениях.' },

  # DevOps
  { body: 'Что такое контейнеризация и какие преимущества она дает?' },
  { body: 'Объясните принцип работы CI/CD и зачем он нужен.' },
  { body: 'Что такое инфраструктура как код (IaC) и популярные инструменты для ее реализации?' },

  # Game Development
  { body: 'Что такое игровой движок и какие известные движки вы знаете?' },
  { body: 'Объясните разницу между 2D и 3D графикой в играх.' },
  { body: 'Что такое игровой цикл (game loop) и почему он важен?' }
]

question_records = []
questions.each_slice(3).with_index do |question_group, index|
  test = tests[index]
  test_record = test_records[test[:title]]

  question_group.each do |question|
    question[:test] = test_record
    question_records << Question.find_or_create_by!(body: question[:body], test: test_record)
  end
end

# == Создаем ответы
answers = [
  # === Уровень 1 ===

  # Frontend
  { body: 'Язык разметки для создания веб-страниц', correct: true },
  { body: 'Язык программирования', correct: false },
  { body: 'Фреймворк для разработки', correct: false },
  { body: 'База данных', correct: false },

  { body: 'Отвечает за внешний вид страницы', correct: true },
  { body: 'Отвечает за логику сайта', correct: false },
  { body: 'Язык программирования', correct: false },
  { body: 'База данных', correct: false },

  { body: 'Язык программирования для браузера', correct: true },
  { body: 'Система управления базами данных', correct: false },
  { body: 'Язык разметки', correct: false },
  { body: 'Операционная система', correct: false },

  # Backend
  { body: 'Компьютер, который обрабатывает запросы', correct: true },
  { body: 'Браузер пользователя', correct: false },
  { body: 'Язык программирования', correct: false },
  { body: 'Фреймворк', correct: false },

  { body: 'Система для хранения данных', correct: true },
  { body: 'Программа для рисования', correct: false },
  { body: 'Язык программирования', correct: false },
  { body: 'Операционная система', correct: false },

  { body: 'Интерфейс для взаимодействия программ', correct: true },
  { body: 'Программа для обработки изображений', correct: false },
  { body: 'Система управления базами данных', correct: false },
  { body: 'Язык программирования', correct: false },

  # Mobile Development
  { body: 'Программа для смартфона или планшета', correct: true },
  { body: 'Операционная система', correct: false },
  { body: 'Язык программирования', correct: false },
  { body: 'Веб-сайт', correct: false },

  { body: 'iOS и Android', correct: true },
  { body: 'Windows и Linux', correct: false },
  { body: 'MacOS и Unix', correct: false },
  { body: 'Java и Kotlin', correct: false },

  { body: 'Количество пикселей на экране', correct: true },
  { body: 'Тип батареи', correct: false },
  { body: 'Процессор устройства', correct: false },
  { body: 'Версия ОС', correct: false },

  # DevOps
  { body: 'Компьютер, предоставляющий сервисы', correct: true },
  { body: 'Программа для создания дизайна', correct: false },
  { body: 'Язык программирования', correct: false },
  { body: 'База данных', correct: false },

  { body: 'Номер версии программного обеспечения', correct: true },
  { body: 'Дата выпуска устройства', correct: false },
  { body: 'Название проекта', correct: false },
  { body: 'Имя пользователя', correct: false },

  { body: 'Создание копий данных для восстановления', correct: true },
  { body: 'Удаление файлов', correct: false },
  { body: 'Изменение дизайна сайта', correct: false },
  { body: 'Запуск игр', correct: false },

  # Game Development
  { body: 'Программа для развлечения и взаимодействия', correct: true },
  { body: 'Операционная система', correct: false },
  { body: 'Язык программирования', correct: false },
  { body: 'База данных', correct: false },

  { body: 'Экшен, РПГ, Стратегия', correct: true },
  { body: 'HTML, CSS, JavaScript', correct: false },
  { body: 'Windows, Linux, MacOS', correct: false },
  { body: 'Сервер, Клиент, Прокси', correct: false },

  { body: 'Главный герой игры', correct: true },
  { body: 'Системная ошибка', correct: false },
  { body: 'Тип файла', correct: false },
  { body: 'Название компании', correct: false },

  # === Уровень 2 ===

  # Frontend
  { body: 'Механизм для минимизации изменений в реальном DOM', correct: true },
  { body: 'Тип базы данных', correct: false },
  { body: 'Операционная система', correct: false },
  { body: 'Язык программирования', correct: false },

  { body: 'Блочные элементы занимают всю ширину, строчные — только содержимое', correct: true },
  { body: 'Строчные элементы занимают всю ширину, блочные — только содержимое', correct: false },
  { body: 'Нет разницы', correct: false },
  { body: 'Это свойства JavaScript', correct: false },

  { body: 'Обработчик событий добавляется к родителю, чтобы ловить события потомков', correct: true },
  { body: 'Обработчик событий добавляется ко всем элементам вручную', correct: false },
  { body: 'Это паттерн для баз данных', correct: false },
  { body: 'Это тип данных в CSS', correct: false },

  # Backend
  { body: 'Архитектурный стиль для взаимодействия клиентов и серверов', correct: true },
  { body: 'Тип компьютера', correct: false },
  { body: 'Язык программирования', correct: false },
  { body: 'База данных', correct: false },

  { body: 'Компонент, обрабатывающий запросы на сервере', correct: true },
  { body: 'Тип клиента', correct: false },
  { body: 'Программа для дизайна', correct: false },
  { body: 'Фреймворк', correct: false },

  { body: 'Библиотека для работы с базой данных через объекты', correct: true },
  { body: 'Язык программирования', correct: false },
  { body: 'Тип сервера', correct: false },
  { body: 'Операционная система', correct: false },

  # Mobile Development
  { body: 'Разработка приложений под конкретную платформу', correct: true },
  { body: 'Универсальный язык программирования', correct: false },
  { body: 'Веб-сайт', correct: false },
  { body: 'Операционная система', correct: false },

  { body: 'Состояния жизненного цикла активности в Android', correct: true },
  { body: 'Тип процессора', correct: false },
  { body: 'Вид экрана', correct: false },
  { body: 'Язык программирования', correct: false },

  { body: 'Паттерн для разделения UI и логики', correct: true },
  { body: 'Тип базы данных', correct: false },
  { body: 'Фреймворк', correct: false },
  { body: 'Операционная система', correct: false },

  # DevOps
  { body: 'Изоляция приложений в контейнерах', correct: true },
  { body: 'Язык программирования', correct: false },
  { body: 'База данных', correct: false },
  { body: 'Операционная система', correct: false },

  { body: 'Автоматизация сборки и деплоя', correct: true },
  { body: 'Ручное обновление сервера', correct: false },
  { body: 'Создание резервных копий', correct: false },
  { body: 'Мониторинг игр', correct: false },

  { body: 'Управление инфраструктурой с помощью кода', correct: true },
  { body: 'Ручное администрирование серверов', correct: false },
  { body: 'Создание игр', correct: false },
  { body: 'Пользовательский интерфейс', correct: false },

  # Game Development
  { body: 'Программное обеспечение для создания игр', correct: true },
  { body: 'База данных', correct: false },
  { body: 'Операционная система', correct: false },
  { body: 'Язык программирования', correct: false },

  { body: '2D — плоская графика, 3D — объёмная', correct: true },
  { body: '2D — объёмная графика, 3D — плоская', correct: false },
  { body: 'Операционная система', correct: false },
  { body: 'Язык программирования', correct: false },

  { body: 'Основной цикл обработки событий и отрисовки игры', correct: true },
  { body: 'Тип игрового персонажа', correct: false },
  { body: 'Формат файла', correct: false },
  { body: 'Название компании', correct: false }
]

answers.each_slice(4).with_index do |answer_group, index|
  question = question_records[index]

  answer_group.each do |answer|
    Answer.find_or_create_by!(body: answer[:body], question: question) do |a|
      a.correct = answer[:correct]
    end
  end
end

# == Создаем результаты прохождения тестов
test_passages_data = [
  { user_email: 'ivan@example.com', test_title: 'Frontend Basics' },
  { user_email: 'ivan@example.com', test_title: 'Backend Basics' },
  { user_email: 'svetlana@example.com', test_title: 'Mobile Basics' }
]

test_passages_data.each do |tp|
  user = user_records[tp[:user_email]]
  test = test_records[tp[:test_title]]

  TestPassage.find_or_create_by!(user: user, test: test)
end

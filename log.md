## 2026-11-25 — итоговый Python-подгруз радара Radmir RP (по образу source/ + HUDBUILDER)

- Подгруз в C:\Users\rodio\OneDrive\Рабочий стол\мой подгруз
- Структура по принципу исходников source/ + HUDBUILDER:
  - builder.py — Python builder (собирает JS, вставляет картинки из папок в base64, как builder.py из source/)
  - hud_image_0000_base.js — JS шаблон для CEF (загружается через .asi файл, как hud_image_0000.asi из HUDBUILDER)
  - jspath/hud_image_0000.js — итоговый собранный скрипт (создается запуском builder.py)
  - logo/, icons/, weapon/ — папки для своих PNG ресурсов
  - readme.txt — инструкция
- Команды: /radarcolor <цвет> (CEF-меню цветов без аргументов), /radar (CEF-меню формы миникарты), /logosize <w> <h>
- Настройки в localStorage: цвет обводки, форма миникарты, размер логотипа
- Стиль по принципу исходников CEF (podozdat, podklyuchitKomanduChata, loaderModule.notification, addDialogInQueue, razobratOtvetDialoga)
- Нет батника, нет готовых hud .js/.asi файлов (не трогаются исходные худы)
- Плейсхолдеры RESOURCES заменяются на JSON объект ресурсов (иконки, лого, оружие)
- Исходники подгруз (source, сборки\подгроуз\Создание) не изменены
- Синхронизация с GitHub не прошла (нет сети), коммит локальный

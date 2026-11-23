## 2026-11-23 — финальный Python-подгруз радара Radmir RP (по образу source/builder.py)

- Подгруз в C:\Users\rodio\OneDrive\Рабочий стол\мой подгруз
- Структура по принципу исходников source/ (Epilepsia Builder):
  - builder.py — Python builder (собирает JS, вставляет картинки из папок в base64, как builder.py из source/)
  - radar_base.js — JS шаблон для CEF (команды /radarcolor, /radar, /logosize)
  - jspath/radar_mod.js — итоговый собранный скрипт (создаётся запуском builder.py)
  - logo/, icons/, weapon/ — папки для своих PNG ресурсов
  - readme.txt — инструкция
- Команды: /radarcolor <цвет> (CEF-меню цветов без аргументов), /radar (CEF-меню формы миникарты), /logosize <w> <h>
- Настройки в localStorage: цвет обводки, форма миникарты, размер логотипа
- Стиль по принципу исходников CEF (podozdat, podklyuchitKomanduChata, loaderModule.notification, addDialogInQueue, razobratOtvetDialoga)
- Нет батника, нет готовых hud .js/.asi файлов (не трогаются исходные худы)
- Удалён лишний build_radar.py от предыдущей итерации
- Исходники подгруз (source, сборки\подгроуз\Создание) не изменены

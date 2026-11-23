## 2026-11-23 — полная версия подгруз радара Radmir RP (по образу HUDBUILDER)

- Создан подгруз в C:\Users\rodio\OneDrive\Рабочий стол\мой подгруз
- Структура как в исходной сборке: hud_image_0000.js + папки logo/, icons/, weapon/ для своих PNG
- hud_image_0000.js: команды /radarcolor <цвет>, /radar (CEF-меню выбора формы миникарты), /logosize <w> <h>, /setlogo <файл.png>
- Настройки в localStorage; стиль по принципу исходников CEF (podozdat, podklyuchitKomanduChata, loaderModule.notification, addDialogInQueue, razobratOtvetDialoga)
- readme.txt: инструкция по установке и кладу PNG в папки
- install.bat: копирование скрипта и папок ресурсов в игру
- Удалён лишний radar_mod.js от предыдущей итерации
- Исходники подгруза (source, сборки\подгроуз\Создание) не изменены

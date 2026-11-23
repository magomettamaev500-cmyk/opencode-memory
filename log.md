## 2026-11-23 — идеальная версия подгруз радара Radmir RP (по образу HUDBUILDER)

- Создан подгруз в C:\Users\rodio\OneDrive\Рабочий стол\мой подгруз
- Структура как в исходной сборке: hud_image_0000.js + папки logo/, icons/, weapon/ для своих PNG
- hud_image_0000.js: команды /radarcolor <цвет> (CEF-меню цветов без аргументов), /radar (CEF-интерфейс выбора формы миникарты), /logosize <w> <h>, /setlogo <файл.png>
- Настройки в localStorage; стиль по принципу исходников CEF (podozdat, podklyuchitKomanduChata, loaderModule.notification, addDialogInQueue, razobratOtvetDialoga)
- readme.txt: инструкция по установке и кладу PNG в папки
- install.bat: копирование скрипта и папок ресурсов в игру
- Удалён лишний radar_mod.js от предыдущих итераций
- Исходники подгруза (source, сборки\подгроуз\Создание) не изменены

## 2026-11-23 — подгруз радара Radmir RP (убрана команда /setlogo)

- Создан подгруз в C:\Users\rodio\OneDrive\Рабочий стол\мой подгруз
- Структура как в исходной сборке: hud_image_0000.js + папки logo/, icons/, weapon/ для своих PNG
- hud_image_0000.js: команды /radarcolor <цвет> (CEF-меню цветов без аргументов), /radar (CEF-интерфейс выбора формы миникарты), /logosize <w> <h>
- Убрана команда /setlogo и весь связанный с ней код (logoUrl, восстановление из localStorage, блок backgroundImage)
- Настройки в localStorage: цвет обводки, форма миникарты, размер логотипа
- Стиль по принципу исходников CEF (podozdat, podklyuchitKomanduChata, loaderModule.notification, addDialogInQueue, razobratOtvetDialoga)
- readme.txt и install.bat обновлены (убраны упоминания /setlogo)
- Исходники подгруза (source, сборки\подгроуз\Создание) не изменены

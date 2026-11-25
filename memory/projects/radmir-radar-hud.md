# Radar HUD — подгруз миникарты для Radmir RP

- Путь: `C:\Users\rodio\OneDrive\Рабочий стол\подгруз ии`
- Референс: `C:\Users\rodio\OneDrive\Рабочий стол\source` — CEF/JS-сборщик ScriptLoader, не MoonLoader.

## Задачи

- Добавить `/radarcolor` (цвет обводки) и `/radar` (форма) с сохранением настроек, не ломая HUD Radmir.

## Решения

- HUD Radmir — CEF/JS: команды через `podklyuchitKomanduChata`, диалоги `addDialogInQueue` + перехват `sendClientEvent`/`OnDialogResponse`, настройки в `localStorage`.
- Основной вариант — Lua/MoonLoader: `sampRegisterChatCommand`, `sampAddChatMessage`, INI-конфиг, рамка через `renderDrawBox`/`renderDrawLine`; в память не пишет, CSS худа не трогает.
- Опциональный CEF-модуль меняет реальные CSS-селекторы `#app .hud-radmir-radar__map` и перехватывает `/radar` в `window.__configfunCommands`.
- Геометрия рамки повторяет `vh` из `original.js`: round 22×22, square 21.9×20.9, rect 26.3×16.9, oval 26.3×16.9 + `left: 10.3vh`.
- Автор в скриптах — `lastdance`.

## Заметки

- Структура: `moonloader\radar_hud.lua`, модули в `moonloader\lib\radar_hud\`, конфиг `moonloader\config\radar_hud.ini`.
- `podklyuchitKomanduChata` игнорирует повторную регистрацию и передаёт обработчику всю строку команды — CEF-модуль подменяет `handler` в `__configfunCommands` и отрезает команду.
- `getWorkingDirectory()` в MoonLoader — папка `moonloader`; пользовательские модули ищутся в `moonloader\lib`.
- Проверка: `node --check` для JS, `luaparse` для Lua, fengari-тест `config`/`radar`/`util`.

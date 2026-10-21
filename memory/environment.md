# Окружение

## Система

- ОС: Windows 10 Pro, версия `10.0.19045`, x64.
- Shell: PowerShell `5.1.19041.6456`.
- Локаль: `ru-RU`.
- Кодовая страница консоли по умолчанию — **866**. Кириллица в выводе
  команд ломается. Лечится: `chcp 65001` или
  `[Console]::OutputEncoding = [Text.Encoding]::UTF8`.
- User profile: `C:\Users\rodio`, домашняя директория в git — `~/`.

## Инструменты

| Инструмент      | Версия                | Путь                                        |
| --------------- | --------------------- | ------------------------------------------- |
| node            | v24.21.0              | `C:\Program Files\nodejs\node.exe`          |
| git             | 2.55.0.windows.5      | `C:\Program Files\Git\cmd\git.exe`          |
| gh (GitHub CLI) | 2.102.1               | `C:\Program Files\GitHub CLI\gh.exe`        |
| winget          | —                     | `%LOCALAPPDATA%\Microsoft\WindowsApps\winget.exe` |

- `git` и `gh` **не были** установлены в системе изначально — поставлены
  2026-10-21 через `winget`.
- Авторизация GitHub: `gh auth login --web`, токен в системном хранилище
  (keyring), scope `repo`. Учётка — `magomettamaev500-cmyk`.
- `~/.gitconfig` создан через `gh auth setup-git` — git пушит через
  credential helper, токен в открытом виде не хранится.
- `chcp 65001` в PowerShell: без этого кириллица из внешних команд
  выводится как мусор.

## Речевые голоса (TTS)

- Синтез речи в системе: `Microsoft Irina` (ru-RU, жен.), `Microsoft Zira`
  (en-US, жен.).
- **Румынского/молдовского голоса нет** — ни в SAPI, ни в `Speech_OneCore`.
- Установка (нужны права администратора):
  `dism /online /add-capability /capabilityname:Language.Speech~~~ro-RO~`
- В браузере доступен Web Speech API; Google Chrome несёт облачные
  румынские голоса. `SpeechRecognition` работает только в Chrome/Edge на ПК.

## PowerShell 5.1 — важные особенности

- Кодовая страница консоли 866. Для читаемого русского вывода:
  `[Console]::OutputEncoding = [Text.Encoding]::UTF8` в начале скрипта.
- **`.ps1` с кириллицей обязан быть в UTF-8 с BOM** — без BOM PowerShell 5.1
  читает файл как ANSI, и битые кавычки роняют разбор скрипта.
- `Get-Content -Raw -Encoding UTF8` читает UTF-8 без BOM корректно.
- Chrome в системе не установлен.

## Браузерная проверка (инструменты агента)

- Встроенный Chromium сообщает `prefers-reduced-motion: reduce` — CSS-анимации
  отключаются. Для проверки 3D-эффектов нужен статичный запасной ракурс.
- `browser.tabs.open` не принимает `file://` — поднимать локальный HTTP-сервер.
- `browser.screenshot` падает с «needs a visible tab», если окно не в фокусе —
  сначала `browser.tabs.focus`, при неудаче открыть вкладку заново.
- `location.hash = ...` из скрипта вызывает `hashchange` асинхронно: правки DOM,
  сделанные сразу после, могут быть затёрты перерисовкой. Вызывать `App.route()`
  явно.

## OpenCode

- Глобальный конфиг: `C:\Users\rodio\.config\opencode\opencode.jsonc`.
- Данные: `C:\Users\rodio\.local\share\opencode`
  - `opencode.db` — SQLite-база сессий, не редактировать.
  - `log/opencode.log` — логи.
  - `repos/` — кэш клонированных `references` с Git-репозиториев.
  - `shell/` — состояние shell-сессий.
- Пароль сервиса: `C:\Users\rodio\.config\opencode\service.json`.
- Сервер: `http://127.0.0.1:4096`.
- Модель в этой сессии: `opencode/minimax-m3.1-flash-free`.

## Директории

- Документы синхронизируются с OneDrive:
  `C:\Users\rodio\OneDrive\Документы` — **не годится для git-репозиториев**
  (конфликты синхронизации). Рабочие клоны держать в `C:\Users\rodio\<имя>`.
- Рабочий каталог текущей сессии:
  `C:\Users\rodio\OneDrive\Документы\Проект по умолчанию` (пуст).

### Известные директории в профиле

| Директория               | Назначение (предположительное) |
| ------------------------ | ------------------------------ |
| `ansel`                  | проект                           |
| `meta_hack`              | проект                           |
| `meta_hack_extracted`    | распакованный `meta_hack`       |
| `minecraft-telegram-bot` | проект                           |
| `radmir-logging-system`  | проект                           |
| `opencode-memory`        | память агента (этот репозиторий) |

## Git

- `core.autocrlf` в клоне памяти выставлен в `false` — переносы строк не
  искажаются.
- Коммиты в памяти: `memory: <что записано>`.

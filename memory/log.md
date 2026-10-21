# Журнал

Хронология: что узнали, что решили, что поменялось в памяти.

## 2026-10-21 — Подключение памяти на GitHub

- Создан репозиторий `magomettamaev500-cmyk/opencode-memory` (публичный,
  ветка `main`). Локальный клон: `C:\Users\rodio\opencode-memory`.
- Референс `memory` добавлен в глобальный конфиг OpenCode
  (`~/.config/opencode/opencode.jsonc`) как `path`-ссылка на клон.
- `AGENTS.md` репозитория подключён через `instructions`, чтобы протокол
  работы с памятью был в контексте каждый раз.
- Решено не использовать `references.repository` для записи: кэшированный
  checkout в `~/.local/share/opencode/repos` сбрасывается при авто-обновлении
  раз в 24 часа. Для записи нужен свой клон, синхронизация — через
  `scripts/sync.ps1`.
- Установлены `git 2.55.0` и `gh 2.102.1` через winget (до этого в системе
  не было). Авторизация — `gh auth login --web`, учётка
  `magomettamaev500-cmyk` (не совпадает с именем профиля Windows `rodio`).
- Git-идентичность в клоне: `magomettamaev500-cmyk`,
  `324162891+magomettamaev500-cmyk@users.noreply.github.com`.

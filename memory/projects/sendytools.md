# SendyTools — ASI-плагин для GTA SA (SAMP 0.3.7)

Путь: `C:\Users\rodio\SendyTools`. Готовый билд: `Рабочий стол\фыв\SendyTools.asi`.

## Что это
- Один файл `SendyTools.asi` для RADMIR RP: локальная авторизация ключом
  (`/logintools` + ImGui-модалка), счётчик ответов на репорты (`/pm`, `/ans`),
  меню Home (правила с поиском, счётчик, настройки, о плагине), логотип.
- Ключ (регистр важен): `Sendy-SDJ...9248583`, хранится XOR-массивом 0x5A в
  `src\key_obf.h`. Никаких отправок на сервер — только локальный перехват команд.

## Сборка
- Основной тулчейн MSVC не установлен (см. environment.md) — собирается MinGW:
  `build_mingw.bat` → `dist\SendyTools.asi` (PE32, ~1.9 МБ, всё статически).
- Для VS2022 приложен `SendyTools.vcxproj` (Release|Win32, /MT, /utf-8).
- Флаги g++: `-std=c++17 -O2 -m32 -shared -static -static-libgcc -static-libstdc++`
  + либы `-luser32 -lgdi32 -lwinmm -limm32 -ldwmapi` (**-ldwmapi обязателен** —
  ImGui win32-backend линкуется к DWM).

## Смещения SAMP (из py-samp-api, не выдуманы)
| Что            | R3       | R4       |
| -------------- | -------- | -------- |
| SendCmd        | 0x69110  | 0x698C0  |
| AddToChat      | 0x67460  | 0x67BA0  |
| SAMP_INFO      | 0x26E8DC | 0x26EA0C |
| chatPtr        | 0x26E8C8 | 0x26E9F8 |
| verStr         | 0xE5982 (R3/R4), 0xD3982 (R1/R2) |

- AddToChatWindow — __thiscall: pChat в ECX + (mode=2, text, 0, color, 0);
  цвет 0xAARRGGBB (0xFFFF9A00 работает).
- Коннект-детект: мониторинг SAMP_INFO+0x20 (szIP), не RPC.

## Placeholder'ы (пользователь заменит)
- `src\logo.h` — JPEG логотипа (инструкция внутри); пока рисуется векторная «S».
- `src\rules_data.cpp` — тексты правил RADMIR.

## Грабли
- bat-файлы: только ASCII, без `(` `)` в echo внутри if-блоков; LF-концы строк
  конвертировать в CRLF (write-инструмент пишет LF).
- MinGW по умолчанию UTF-8 exec charset — исходники UTF-8 без BOM, совпадает
  с /utf-8 MSVC.
- Консоль CP866: `[Console]::OutputEncoding = UTF8` + `Out-String -Width 240`.

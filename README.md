Meshcore RPM
============================

Сборщик rpm пакета с [Meshcore](https://meshcoretel.ru/ru) из [https://files.liamcottle.net/MeshCore/](https://files.liamcottle.net/MeshCore/). Проверено на дистрибутиве Fedora 43 Linux (сборка LXQT)

Зависимости
============================

- `curl` - для загрузки архива
- `unzip` - для распаковки zip архива
- `nfpm` - для создания rpm пакета
- `GNU make` - для упрощения запуска всех команд

Можно установить командой `sudo dnf install curl unzip nfpm make`.

Как использовать?
============================

Склонируйте репозиторий - `git clone https://github.com/vodolaz095/meshcore_rpm.git`.

Если все зависимости установлены, то будут работать эти команды:

- `make clean` - удаляет временные файлы
- `make download` - качает zip архив из https://files.liamcottle.net/MeshCore/
- `make unpack` - распаковывает архив в `./opt/`
- `make rpm` - собирает `rpm` пакетв в директорию по умолчанию - `~/rpmbuild/RPMS/x86_64/`
- `make sign` - подписывает и публикует `rpm` пакет во внутренний репозиторий (обычно, не нужно)

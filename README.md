Meshcore RPM
============================

Сборщик rpm пакета с [Meshcore](https://meshcoretel.ru/ru) из [https://files.liamcottle.net/MeshCore/](https://files.liamcottle.net/MeshCore/)


Как использовать?
============================

- `make clean` - удаляет временные файлы
- `make download` - качает zip архив из https://files.liamcottle.net/MeshCore/
- `make unpack` - распаковывает архив в `./opt/`
- `make rpm` - собирает `rpm` пакетв в директорию по умолчанию - `~/rpmbuild/RPMS/x86_64/`
- `make sign` - подписывает и публикует `rpm` пакет во внутренний репозиторий (обычно, не нужно)

Meshcore RPM
============================

Сборщик rpm пакета с клиентом для [Meshcore](https://meshcoretel.ru/ru) с официальным Desctop GUI приложением из [https://files.liamcottle.net/MeshCore/](https://files.liamcottle.net/MeshCore/). Проверено на дистрибутиве Fedora 43 Linux (сборка LXQT)

Зачем?
============================

1. В RPM дистрибутивах (включая Fedora Linux) нет GUI приложения для Meshcore  - https://www.rpmfind.net/linux/rpm2html/search.php?query=meshcore
2. В COPR пакетов также нет https://copr.fedorainfracloud.org/coprs/fulltext/?fulltext=meshcore
3. В официальной сборке Meshcore клиента для Linux есть просто zip архив, с исполнимыми файлами и библиотеками, который не понятно как правильно устанавливать

Поэтому, я решил написать утилиту, которая 

1. Загружает официальный zip архив с GUI клиентом Meshcore
2. Перепаковывает его в установочный пакет rpm
3. Пакет легко устанавливается, а также легко удаляется\обновляется.

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
- `make rpm` - собирает `rpm` пакет в в директорию по умолчанию - `~/rpmbuild/RPMS/x86_64/`
- `make sign` - подписывает и публикует `rpm` пакет во внутренний репозиторий (обычно, не нужно)

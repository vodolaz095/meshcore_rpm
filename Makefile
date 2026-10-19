ZIP_FILE := meshcore.zip
URL      := https://files.liamcottle.net/MeshCore/v1.50.0/MeshCore-v1.50.0+78-b7528a7-linux-x86_64.zip
DEST_DIR := opt
VERSION  := 1.50.0

tools:
	which nfpm  # sudo dnf install nfpm
	which curl  # sudo dnf install curl
	which unzip # sudo dnf install unzip

clean:
	rm -f $(ZIP_FILE)
	rm -rf $(opt)

download:
	@if [ ! -f "$(ZIP_FILE)" ]; then \
		if ! curl -fL -o "$(ZIP_FILE)" "$(URL)"; then \
			rm -f "$(ZIP_FILE)"; \
			exit 1; \
		fi; \
		echo "Архив скачан и сохранён как $(ZIP_FILE)"; \
	else \
		echo "Файл $(ZIP_FILE) уже существует, пропускаю скачивание."; \
	fi

unpack: download
	@mkdir -p "$(DEST_DIR)"
	@echo "Распаковываю $(ZIP_FILE) в ./$(DEST_DIR) ..."
	@if command -v unzip >/dev/null 2>&1; then \
		unzip -o "$(ZIP_FILE)" -d "$(DEST_DIR)"; \
	else \
		echo "Ошибка: утилита unzip не найдена. Установите её (например: dnf install unzip)." >&2; \
		exit 1; \
	fi
	@echo "Готово. Содержимое распаковано в ./$(DEST_DIR)"

rpm: unpack
	mkdir -p ~/rpmbuild/RPMS/x86_64/
	SEMVER=$(VERSION) nfpm package -p rpm -t ~/rpmbuild/RPMS/x86_64/

publish:
	rpm --addsign ~/rpmbuild/RPMS/x86_64/meshcore-$(VERSION)-1.x86_64.rpm
	rpm --checksig -v ~/rpmbuild/RPMS/x86_64/meshcore-$(VERSION)-1.x86_64.rpm
	/home/vodolaz095/projects/oldcity/build_rpm_repo.sh

# Makefile

default: firebase_install

firebase_install:
ifeq (, $(shell command -v firebase))
	sudo npm install -g firebase-tools
endif
	cd functions && npm install
	cd functions && npm run serve


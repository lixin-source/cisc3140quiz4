# Makefile

default: firebase_install

firebase_install:
# check to see if firebase is installed
ifeq (, $(shell command -v firebase))
	sudo npm install -g firebase-tools
endif
	# install any dependencies used needed for project
	cd functions && npm install
	# start server
	cd functions && npm run serve

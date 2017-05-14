PKGS=gtk+-3.0

build:
	valac --pkg=$(PKGS) Vodo.vala

.PHONY: build

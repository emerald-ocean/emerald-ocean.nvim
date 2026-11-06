PALETTE_VERSION := v0.1.0
EMERALD_GEN := go run github.com/emerald-ocean/palette/cmd/emerald-gen@$(PALETTE_VERSION)

.PHONY: generate check-generated lint test palette-version update-palette

generate:
	$(EMERALD_GEN) generate -template templates/palette.lua.tmpl -out lua/emerald-ocean/palette.lua

check-generated:
	@tmp=$$(mktemp); \
	$(EMERALD_GEN) generate -template templates/palette.lua.tmpl -out $$tmp && \
	diff -u lua/emerald-ocean/palette.lua $$tmp; \
	status=$$?; rm -f $$tmp; exit $$status

lint:
	stylua --check .

test:
	nvim --headless -u NONE --cmd 'set rtp^=.' -l test/load.lua

palette-version:
	@echo $(PALETTE_VERSION)

update-palette:
	@test -n "$(VERSION)" || { echo "usage: make update-palette VERSION=vX.Y.Z"; exit 1; }
	awk -v v="$(VERSION)" '/^PALETTE_VERSION := /{$$0 = "PALETTE_VERSION := " v} {print}' Makefile > Makefile.tmp
	mv Makefile.tmp Makefile
	$(MAKE) generate

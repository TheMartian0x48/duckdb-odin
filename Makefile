ODIN    ?= odin
OUT     := bin
EXAMPLE := $(OUT)/example

# Odin always links through `clang`. DuckDB is C++, so on non-macOS link with g++
# by putting a clang -> g++ shim first on PATH.
# Static libs need a recent libstdc++ (GCC 11+); use a gcc-toolset's g++ if installed.
ifneq ($(shell uname -s),Darwin)
GXX ?= g++
SHIM := $(OUT)/shim
export PATH := $(abspath $(SHIM)):$(PATH)
endif

.PHONY: all help libs check build run clean

all: build

help: ## Show this help
	@awk 'BEGIN {FS = ":.*## "} /^[a-zA-Z_-]+:.*## / {printf "  \033[36m%-14s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

libs: ## Unpack static-libs/*.zip into static-libs/<platform>/
	@for z in static-libs/static-libs-*.zip; do \
		d=$${z#static-libs/static-libs-}; d=static-libs/$${d%.zip}; \
		mkdir -p $$d && unzip -qo $$z -d $$d && echo "unpacked $$d"; \
	done

check: ## Type-check the bindings package
	$(ODIN) check . -no-entry-point

build: | $(OUT) $(SHIM) ## Build the example (statically linked)
	$(ODIN) build example -out:$(EXAMPLE)

run: | $(OUT) $(SHIM) ## Build and run the example
	$(ODIN) run example -out:$(EXAMPLE)

$(OUT):
	mkdir -p $(OUT)

$(SHIM): | $(OUT)
	mkdir -p $(SHIM) && ln -sf "$$(command -v $(GXX))" $(SHIM)/clang

clean: ## Remove build output
	rm -rf $(OUT)


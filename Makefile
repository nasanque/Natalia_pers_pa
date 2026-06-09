.PHONY: serve build validate clean

serve:
	hugo server --buildDrafts --disableFastRender

build:
	hugo --minify

validate:
	@bash scripts/validate.sh

clean:
	rm -rf public resources/_gen .hugo_build.lock

# Run full check: clean, build, validate
check: clean validate

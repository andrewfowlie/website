MESSAGE ?= 'update webpage'

.PHONY: hugo-debian
hugo-debian:
	wget -nc https://github.com/gohugoio/hugo/releases/download/v0.59.0/hugo_0.59.0_Linux-64bit.deb
	dpkg -i hugo_0.59.0_Linux-64bit.deb
	rm hugo_0.59.0_Linux-64bit.deb
	echo "hugo hold" | sudo dpkg --set-selections

.PHONY: hugo-fedora
hugo-fedora:
	dnf install alien
	wget -nc https://github.com/gohugoio/hugo/releases/download/v0.59.0/hugo_0.59.0_Linux-64bit.deb
	alien -i hugo_0.59.0_Linux-64bit.deb
	dnf versionlock add hugo
	rm hugo_0.59.0_Linux-64bit.deb

.PHONY: setup
setup: | public themes/academic
	cd themes/academic && git checkout v4.2.0
	cd public && git checkout master
	cd public && git pull
	git checkout master
	git pull
	hugo version | grep -q v0.59.0

.PHONY: update
update:
	git add -A
	git commit -m "$(MESSAGE)"
	git push

.PHONY: preview
preview:
	hugo server --navigateToChanged & sleep 1 && xdg-open http://localhost:1313

.PHONY: dirty
dirty:
	@[ -z "$$(git status --short)" ] || (echo "git tree dirty" && git status --short && exit 1)

.PHONY: deploy
deploy: dirty setup
	hugo
	cd public && git add -A
	cd public && git commit -m "$(MESSAGE)"
	cd public && git push

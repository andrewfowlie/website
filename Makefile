MESSAGE ?= $(MESSAGE)

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

.PHONY: deploy
deploy: setup
	hugo
	cd public && git add -A
	cd public && git commit -m "$(MESSAGE)"
	cd public && git push

dnf install alien
wget https://github.com/gohugoio/hugo/releases/download/v0.59.0/hugo_0.59.0_Linux-64bit.deb
alien -r hugo_0.59.0_Linux-64bit.deb
dnf install -y hugo_0.59.0_Linux-64bit.rpm
rm hugo_0.59.0_Linux-64bit.deb
rm hugo_0.59.0_Linux-64bit.rpm
```bash
# setup codes

git clone --recursive https://github.com/andrewfowlie/website
cd website
make setup

# edit and check

make preview

# update and deploy

make update MESSAGE="updating source"
make deploy MESSAGE="updating webpage"
```

#!/usr/bin/env bash

# 确保脚本抛出遇到的错误
set -e

# 生成静态文件
yarn docs:build

# 复制dockerFile文件和nginx配置文件
cp Dockerfile ../note/docs/.vuepress/dist
cp default.conf ../note/docs/.vuepress/dist

# 进入生成的文件夹
cd ../note/docs/.vuepress/dist

git init
git add -A
git commit -m 'deploy'

# 如果发布到 https://<USERNAME>.github.io
# git push -f git@github.com:<USERNAME>/<USERNAME>.github.io.git master
git push -f git@github.com:AJianNote/vue-study-note.git master:gh-pages

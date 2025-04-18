#! /usr/bin/env bash
set -uvx
set -e
cd "$(dirname "$0")"
cwd=`pwd`
#ts=`date "+%Y.%m%d.%H%M.%S"`
ts=`date "+%Y.%m%d.%H%M"`
version="${ts}"

cd $cwd
dart analyze . --fatal-infos
dart test

sed -i -e "s/<Version>.*<\/Version>/<Version>${version}<\/Version>/g" pubspec.yaml
sed -i -e "s/^version:.*$/version: ${version}/g" pubspec.yaml

tag="$version"
cd $cwd
git add .
git commit -m"$tag"
git tag -a "$tag" -m"$tag"
git push origin "$tag"
git push origin HEAD:main
git remote -v
echo $tag

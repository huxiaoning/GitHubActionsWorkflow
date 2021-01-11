#!/bin/bash
java -jar -Dwork.dir=$(pwd) ./github/scripts/gitbook-helper-1.0-SNAPSHOT.jar
rm -rf _book docs
gitbook build
mv _book docs
git add .
git commit -m "UP"
git push

#!/bin/bash
target=$1

if [ -z $target ]; then
	echo "Usage: groupId=group artifactId=name ./genwar.sh target"
	exit 1
fi

if [ ! -d $target ]; then
	echo "target must be a directory"
	exit 1
fi

files=$(find $target -type f | wc -l)

if [ $files -gt 0 ]; then
	echo "target directory must not contain files"
	exit 1
fi

if [ -z $groupId ]; then
	echo "Missing groupId"
	exit 2
fi

if [ -z $artifactId ]; then
	echo "Missing artifactId"
	exit 2
fi

if [ $(echo $groupId | sed -n -e '/^[A-Za-z0-9.]*$/p' | wc -l) -ne 1 ]; then
	echo \"$groupId\" is not valid groupId
	exit 3
fi

if [ $(echo $artifactId | sed -n -e '/^[A-Za-z0-9.-]*$/p' | wc -l) -ne 1 ]; then
	echo \"$artifactId\" is not valid artifactId
	exit 3
fi

mkdir -p $target/src/main/java
mkdir -p $target/src/test/java
mkdir -p $target/src/main/resources
mkdir -p $target/src/main/webapp/WEB-INF

OUT=$(mktemp)
echo "s/\\\${groupId}/${groupId}/g" >> $OUT
echo "s/\\\${artifactId}/${artifactId}/g" >> $OUT
echo "s/\\\${url}/${url}/g" >> $OUT

sed -f $OUT pom.xml > $target/pom.xml
echo $target/pom.xml generated

sed -f $OUT web.xml > $target/src/main/webapp/WEB-INF/web.xml
echo $target/src/main/webapp/WEB-INF/web.xml generated

sed -f $OUT log4j.properties > $target/src/main/resources/log4j.properties
echo $target/src/main/resources/log4j.properties generated

rm -vf $OUT

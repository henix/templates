#!/bin/bash
CLASSPATH=template.jar
for f in lib/*.jar; do
	CLASSPATH=${CLASSPATH}:$f;
done
java -cp ${CLASSPATH} template.Main $@

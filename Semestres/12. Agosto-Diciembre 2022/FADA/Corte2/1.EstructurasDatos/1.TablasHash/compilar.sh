#!/bin/bash
mkdir -p lib
if [ ! -f lib/junit-platform-console-standalone-1.9.1.jar ]; then
	echo "Download junit"
  wget https://github.com/cardel/repositorios/raw/main/lib/junit-platform-console-standalone-1.9.1.jar 
	mv junit-platform-console-standalone-1.9.1.jar  lib/
fi
mkdir -p out
javac -d out TablasHash.java
javac -d out -cp out:lib/junit-platform-console-standalone-1.9.1.jar TablasHashTest.java
java -jar lib/junit-platform-console-standalone-1.9.1.jar --class-path out --scan-class-path

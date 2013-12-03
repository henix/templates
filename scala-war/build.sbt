seq(webSettings :_*)

name := "${name}"

version := "1.0"

scalaVersion := "2.10.0"

scalacOptions ++= Seq("-deprecation", "-feature")

libraryDependencies ++= Seq(
  "javax.servlet" % "servlet-api" % "2.5" % "provided",
  "org.mortbay.jetty" % "jetty" % "6.1.22" % "container"
)

libraryDependencies ++= Seq(
  "com.weiglewilczek.slf4s" % "slf4s_2.9.1" % "1.0.7",
  "ch.qos.logback" % "logback-classic" % "1.0.11"
)

libraryDependencies ++= Seq(
  "commons-io" % "commons-io" % "2.4",
  "org.apache.commons" % "commons-lang3" % "3.1",
  "com.google.guava" % "guava" % "15.0",
  "com.google.code.gson" % "gson" % "2.2.4"
)

libraryDependencies ++= Seq(
  "org.apache.tomcat" % "tomcat-jdbc" % "7.0.47",
  "commons-dbutils" % "commons-dbutils" % "1.5",
  "mysql" % "mysql-connector-java" % "5.1.27"
)

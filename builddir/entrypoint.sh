#!/bin/bash

pwd

cd wildfly-core/
mvn -Dmaven.test.skip=true install
cd -
mvn -Dmaven.test.skip=true install

wget https://download.jboss.org/wildfly/20.0.1.Final/wildfly-20.0.1.Final.tar.gz
mkdir repack
tar xzf wildfly-20.0.1.Final.tar.gz -C repack

cp wildfly-core/controller/target/wildfly-controller-12.0.3.Final.jar repack/wildfly-20.0.1.Final/modules/system/layers/base/org/jboss/as/controller/main/wildfly-controller-12.0.3.Final.jar
cp wildfly-core/server/target/wildfly-server-12.0.3.Final.jar repack/wildfly-20.0.1.Final/modules/system/layers/base/org/jboss/as/server/main/wildfly-server-12.0.3.Final.jar

cd repack
tar czf ../wildfly-20.0.1.Final_custom.tar.gz wildfly-20.0.1.Final


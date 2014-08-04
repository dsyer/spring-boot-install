#!/bin/bash

function install() {
    version=$1
    cp target/install*.jar ~/.gvm/springboot/$version/lib
}

if ! ls target/*.jar > /dev/null; then
    mvn install
fi

source ~/.gvm/bin/gvm-init.sh
using=`gvm current springboot`
if [ "${using#'Not using'}" == "${using}" ]; then
    using="${using#'Using springboot version '}"
else
    using=dev
fi
install dev

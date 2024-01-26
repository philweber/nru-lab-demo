#!/bin/sh

V=1.48.4 ARCH=amd64; echo "https://download.newrelic.com/infrastructure_agent/binaries/linux/${ARCH}/newrelic-infra_linux_${V}_${ARCH}.tar.gz" | { read url; wget "${url}"{,.sum}; shasum -a 256 --check ${url##*/}.sum; }
tar -xf newrelic-infra_linux_1.48.4_amd64.tar.gz
sudo mv ./newrelic-infra/etc/newrelic-infra /etc/
sudo mv ./newrelic-infra/usr/bin/* /usr/bin/
sudo mv ./newrelic-infra/var/db/newrelic-infra/ /var/db/
sudo mv ./newrelic-infra/var/db/newrelic-infra/ /var/db/
sudo mkdir /var/log/newrelic-infra
sudo mkdir /var/run/newrelic-infra
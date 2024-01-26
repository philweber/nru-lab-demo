#!/bin/sh

wget https://download.newrelic.com/infrastructure_agent/binaries/linux/amd64/newrelic-infra_linux_1.48.4_amd64.tar.gz
tar -xf newrelic-infra_linux_1.48.4_amd64.tar.gz
sudo mv ./newrelic-infra/etc/newrelic-infra /etc/
sudo mv ./newrelic-infra/usr/bin/* /usr/bin/
sudo mv ./newrelic-infra/var/db/newrelic-infra /var/db/
sudo mkdir /var/log/newrelic-infra
sudo mkdir /var/run/newrelic-infra
sudo mv newrelic-infra.yml /etc/

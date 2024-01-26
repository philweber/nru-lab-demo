#!/bin/sh

sudo scripts/preinst.sh

# Download Infrastructure agent
wget https://download.newrelic.com/infrastructure_agent/binaries/linux/amd64/newrelic-infra_linux_1.48.4_amd64.tar.gz
# Extract archive
tar -xf newrelic-infra_linux_1.48.4_amd64.tar.gz
# Move files and create directories
sudo mv ./newrelic-infra/etc/newrelic-infra /etc/
sudo mv ./newrelic-infra/usr/bin/* /usr/bin/
sudo mkdir -p /var/db/newrelic-infra
sudo mv ./newrelic-infra/var/db/newrelic-infra/ /var/db/newrelic-infra
sudo mkdir /var/log/newrelic-infra
sudo mkdir /var/run/newrelic-infra
sudo mv newrelic-infra.yml /etc/
# Clean up
rm newrelic-infra_linux_1.48.4_amd64.tar.gz
rm -rf newrelic-infra/

sudo scripts/postinst.sh

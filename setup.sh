#!/bin/sh

sudo scripts/preinst.sh

# Download Infrastructure agent
wget https://download.newrelic.com/infrastructure_agent/binaries/linux/amd64/newrelic-infra_linux_1.48.4_amd64.tar.gz
# Extract archive
tar -xf newrelic-infra_linux_1.48.4_amd64.tar.gz
# Move files and create directories
sudo mv ./newrelic-infra/etc/newrelic-infra /etc/
sudo mkdir /etc/newrelic-infra/logging.d
sudo mv ./newrelic-infra/usr/bin/* /usr/bin/
sudo mkdir -p /var/db/newrelic-infra/newrelic-integrations/logging
sudo mv ./newrelic-infra/var/db/newrelic-infra/ /var/db/newrelic-infra
sudo mkdir /var/log/newrelic-infra
sudo mkdir /var/run/newrelic-infra
# Download and install fluent-bit
wget https://github.com/newrelic/fluent-bit-package/releases/download/1.9.3/td-agent-bit_1.9.3_ubuntu-focal_amd64.deb
sudo apt install ./td-agent-bit_1.9.3_ubuntu-focal_amd64.deb -y
sudo wget -O /var/db/newrelic-infra/newrelic-integrations/logging/out_newrelic.so https://github.com/newrelic/newrelic-fluent-bit-output/releases/download/v1.19.1/out_newrelic-linux-amd64-1.19.1.so
sudo wget -O /var/db/newrelic-infra/newrelic-integrations/logging/parsers.conf https://raw.githubusercontent.com/newrelic/fluent-bit-package/main/parsers.conf

# Clean up
rm td-agent-bit_1.9.3_ubuntu-focal_amd64.deb
rm newrelic-infra_linux_1.48.4_amd64.tar.gz
rm -rf newrelic-infra/

sudo scripts/postinst.sh

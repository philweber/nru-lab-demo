#!/bin/sh

# Enable New Relic GPG key
curl -fsSL https://download.newrelic.com/infrastructure_agent/gpg/newrelic-infra.gpg | sudo gpg --dearmor -o /etc/apt/trusted.gpg.d/newrelic-infra.gpg
# Add New Relic Infastructure repo
echo "deb https://download.newrelic.com/infrastructure_agent/linux/apt focal main" | sudo tee -a /etc/apt/sources.list.d/newrelic-infra.list
# Install New Relic Infra
sudo apt install newrelic-infra -y

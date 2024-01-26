#!/bin/sh
if [ $(grep -c "YOUR_LICENSE_KEY" newrelic-infra.yml) -gt 0 ]
then
    echo "Replace YOUR_LICENSE_KEY in newrelic-infra.yml with the value of the INGEST-LICENSE key for your New Relic account. (Did you remember to save your changes to the file?)"
else
    sudo newrelic-infra &
fi

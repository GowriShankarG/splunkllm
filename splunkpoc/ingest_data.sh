#!/bin/bash
# This script is intended to be executed inside the Splunk Docker container,
# typically invoked from the host machine using 'docker exec'.

# Wait for Splunk to be fully up and running inside the container
# This is crucial because 'splunk add oneshot' needs Splunk to be ready.
echo "Waiting for Splunk to be ready for data ingestion..."
/opt/splunk/bin/splunk status --wait 300 # Wait up to 5 minutes for Splunk to be ready

if [ $? -ne 0 ]; then
    echo "Splunk did not become ready in time. Exiting ingestion script."
    exit 1
fi

echo "Splunk is ready. Ingesting test_data.log..."

# Ingest the test_data.log file into Splunk
# -sourcetype: Specifies the sourcetype for the data. 'syslog' is a common one.
# -index: Specifies the index where the data will be stored. 'main' is the default.
# -auth: Provides authentication credentials for the Splunk CLI.
/opt/splunk/bin/splunk add oneshot /opt/splunk/test_data.log -sourcetype syslog -index main -auth admin:changeme

if [ $? -eq 0 ]; then
    echo "Test data ingested successfully!"
else
    echo "Failed to ingest test data."
fi

# Keep the script running for a bit to allow time for indexing, if needed,
# or simply exit as the data has been added.
# For this example, we just exit.
exit 0


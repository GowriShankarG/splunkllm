FROM splunk/splunk:latest

# Set environment variables for Splunk
# SPLUNK_START_ARGS: Arguments to pass to Splunk on startup.
#                    --accept-license is crucial for automated startup.
# SPLUNK_PASSWORD: The password for the 'admin' user. Change this in a production environment!
ENV SPLUNK_START_ARGS=--accept-license \
    SPLUNK_PASSWORD=changeme

# Expose necessary Splunk ports:
# 8000: Splunk Web UI
# 8088: HTTP Event Collector (HEC)
# 8089: Management port (for Splunkd)
# 9997: Splunk Forwarding port
EXPOSE 8000 8088 8089 9997

# Copy the test data file into the container
# This file will be ingested by Splunk
COPY test_data.log /opt/splunk/test_data.log

# Copy the data ingestion script into the container
# This script will be executed inside the container to add the test data
COPY ingest_data.sh /opt/splunk/bin/ingest_data.sh

# Make the ingestion script executable
#RUN chmod +x /opt/splunk/bin/ingest_data.sh



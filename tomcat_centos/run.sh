#!/bin/bash -ex
# Simple Tomcat app deployment script based on two option ENV variables
# WAR_URL: http(s) URL to the war file to be deployed
# DEPLOY_TO_ROOT: set to 'true' in order to deploy the war file as root app in Tomcat 

# Download the war file
if [ -n "$WAR_URL" ]; then
  if test "$DEPLOY_TO_ROOT" = "true" ; then
    curl -k -o /var/lib/tomcat/webapps/ROOT.war "$WAR_URL"
  else
    (cd /var/lib/tomcat/webapps; curl -k -O "$WAR_URL")
  fi
fi

# Make sure the log exists before tailing it
touch /logs/catalina.out

# Start Tomcat and tail the log
# This provides the logs to `docker logs CONTAINER`
# and prevents the script from finishing
tomcat start && tail -f /logs/catalina.out

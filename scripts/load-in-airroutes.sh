#!/bin/bash -eux


export PROJECT_ROOT_PATH=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )/..

# download sample data
mkdir -p $PROJECT_ROOT_PATH/tmp

# note the switch to xml format, as recommended here: https://groups.google.com/g/gremlin-users/c/Ww9-a0VBOaI
curl -Lo $PROJECT_ROOT_PATH/tmp/air-routes.xml https://github.com/krlawrence/graph/raw/master/sample-data/air-routes.graphml

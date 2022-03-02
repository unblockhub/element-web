#!/bin/bash

set -e

if [ -n "$DIST_VERSION" ]; then
    version=$DIST_VERSION
else
    version=`git describe --dirty --tags || echo unknown`
fi

# Workaround for build issues, see #16555
(cd node_modules/matrix-react-sdk; yarn reskindex)

VERSION=$version yarn build

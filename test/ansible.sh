#!/bin/sh

BASE_DIR=$(dirname "$(readlink -f $0)")  # "

docker rm -f ansible || true
docker run -ti --name ansible \
    --net icc -w /srv \
    -v $(dirname "$BASE_DIR"):/srv \
    ansible sh -c ". /opt/venv/bin/activate; sh deploy.sh $@"

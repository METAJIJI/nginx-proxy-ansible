#!/bin/sh

docker rm -f u18-04 || true
docker run -d --name u18-04 \
    --net icc \
    --cap-add=SYS_ADMIN \
    -v /sys/fs/cgroup:/sys/fs/cgroup:ro \
    --tmpfs /run \
    u18.04-systemd

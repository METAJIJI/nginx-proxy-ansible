#!/bin/sh

docker rm -f c7 || true
docker run -d --name c7 \
    --net icc \
    --cap-add=SYS_ADMIN \
    -v /sys/fs/cgroup:/sys/fs/cgroup:ro \
    --tmpfs /run \
    c7-systemd

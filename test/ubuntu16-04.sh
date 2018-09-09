#!/bin/sh

docker rm -f u16-04 || true
docker run -d --name u16-04 \
    --net icc \
    --cap-add=SYS_ADMIN \
    -v /sys/fs/cgroup:/sys/fs/cgroup:ro \
    --tmpfs /run \
    u16.04-systemd

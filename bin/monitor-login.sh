#!/usr/bin/env bash
# place in /usr/local/bin

# Check all DRM connector status files for "connected"
if grep -q connected /sys/class/drm/*/status; then
  # At least one display is plugged in → start greetd
  systemctl start greetd.service
else
  # No displays → stop greetd (kills any running greeter)
  systemctl stop greetd.service
fi


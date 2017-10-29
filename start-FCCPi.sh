#!/bin/bash

v4l2-ctl --set-ctrl=exposure_auto=1
v4l2-ctl --set-ctrl=exposure_absolute=180
v4l2-ctl --set-ctrl=exposure_absolute=190
v4l2-ctl --set-ctrl=focus_auto=0
v4l2-ctl --set-ctrl=focus_absolute=0
v4l2-ctl --set-ctrl=exposure_absolute=170

v4l2-ctl --set-ctrl=sharpness=150
./ingest.py --video-source hdmi2usb --audio-source none --lightweight --host media-desktop --port 30000

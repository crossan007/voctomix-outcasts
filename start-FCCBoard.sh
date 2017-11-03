#!/bin/bash

TOP=200
BOTTOM=275

LEFT=375
RIGHT=375

./ingest.py --custom-pipeline "videotestsrc ! videoconvert ! videorate ! videoscale ! video/x-raw,format=I420,width=1920,height=1080,framerate=30/1,pixel-aspect-ratio=1/1 ! mux. alsasrc provide-clock=false slave-method=re-timestamp ! audio/x-raw,format=S16LE,channels=2,layout=interleaved,rate=48000 ! queue ! matroskamux name=mux ! queue max-size-time=4000000000 ! tcpclientsink host=127.0.0.1 port=10003"


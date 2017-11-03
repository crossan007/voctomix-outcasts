#!/bin/bash

TOP=200
BOTTOM=275

LEFT=375
RIGHT=375

./ingest.py --custom-pipeline "tcpserversrc port=30000 host=0.0.0.0 ! queue max-size-time=4000000000 ! matroskademux name=d ! jpegdec ! videoflip method=rotate-180 ! tee name=vt ! queue ! videoconvert ! videorate ! videoscale ! video/x-raw,format=I420,width=1920,height=1080,framerate=30/1,pixel-aspect-ratio=1/1 ! mux. audiotestsrc ! audio/x-raw,format=S16LE,channels=2,layout=interleaved,rate=48000 ! tee name=at ! queue ! matroskamux name=mux ! queue max-size-time=4000000000 ! tcpclientsink host=127.0.0.1 port=10000  vt. ! queue ! videoconvert ! videorate ! videocrop top=$TOP left=$LEFT right=$RIGHT bottom=$BOTTOM ! videoscale ! video/x-raw,format=I420,width=1920,height=1080,framerate=30/1,pixel-aspect-ratio=1/1 ! mux2. at. ! queue ! matroskamux name=mux2 ! queue max-size-time=4000000000 ! tcpclientsink host=127.0.0.1 port=10001"

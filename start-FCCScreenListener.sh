#!/bin/bash


./ingest.py --custom-pipeline "tcpserversrc port=30001 host=0.0.0.0 ! queue max-size-time=4000000000 ! matroskademux name=d ! jpegdec ! videoconvert ! videorate ! videoscale ! video/x-raw,format=I420,width=1920,height=1080,framerate=30/1,pixel-aspect-ratio=1/1 ! mux. audiotestsrc name=audiosrc ! audio/x-raw,format=S16LE,channels=2,layout=interleaved,rate=48000 ! matroskamux name=mux ! queue max-size-time=4000000000 ! tcpclientsink host=127.0.0.1 port=10002"


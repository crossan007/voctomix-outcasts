#!/bin/bash

./ingest.py --host media-desktop --custom-pipeline "ximagesrc name=videosrc use-damage=false ! videocrop left=1280 ! jpegenc ! mux. matroskamux name=mux ! queue max-size-time=4000000000 ! tcpclientsink host=192.168.10.15 port=30001"

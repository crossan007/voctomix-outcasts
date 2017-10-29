gst-launch-1.0  \
    tcpclientsrc host=127.0.0.1 port=30000  ! queue ! matroskademux ! decodebin ! videoflip method=rotate-180 ! videoconvert ! \
        tee name="videotee" ! \
            queue ! \
            videoscale add-borders=true ! \
            video/x-raw,width=711,height=400 ! \
            fpsdisplaysink sync=false\
        videotee. ! \
            queue ! \
            videoscale add-borders=true ! \
            video/x-raw,width=711,height=400 ! \
            fpsdisplaysink sync=false            
            
            
            
            #videocrop top=200 left=800 right=800 bottom=600 ! \
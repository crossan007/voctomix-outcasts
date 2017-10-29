gst-launch-1.0 v4l2src ! \
    image/jpeg,width=1920,height=1080,framerate=30/1  ! \
    queue ! \
    jpegdec ! \
    omxh264enc control-rate=3 inline-header=true periodicty-idr=1 target-bitrate=4000000  ! \
    h264parse ! \
    video/x-h264,width=1920,height=1080,framerate=30/1,profile=high,target-bitrate=4000000 ,control-rate=variable,quant-i-frames=250 ! \
    matroskamux ! \
    queue max-size-time=4000000000 ! \
    tcpserversink host=0.0.0.0 port=30000


gst-launch-1.0 v4l2src ! \
    image/jpeg,width=1920,height=1080,framerate=30/1  ! \
    queue ! \
    jpegdec ! \
    omxh264enc ! \
    "video/x-h264,control-rate=2,target-bitrate=800000000,quant-i-frames=100,quant-p-frames=100,quant-b-frames=100,iframeinterval=2,low-latency=true " !\
    h264parse ! \
    matroskamux ! \
    queue max-size-time=4000000000 ! \
    tcpserversink host=0.0.0.0 port=30000


gst-launch-1.0 v4l2src  ! \
    image/jpeg,width=1280,height=1080,framerate=30/1  ! \
    jpegdec ! \
    queue ! \
    omxh264enc control-rate=2 target-bitrate=8000000  ! \
    h264parse ! \
    matroskamux ! \
    queue max-size-time=4000000000 ! \
    tcpserversink host=0.0.0.0 port=30000




gst-launch-1.0 v4l2src  ! \
    video/x-h264 ! \
    h264parse !\
    queue max-size-time=4000000000 ! \
    tcpserversink host=0.0.0.0 port=30000




gst-launch-1.0 v4l2src ! \
    image/jpeg,width=1920,height=1080,framerate=30/1 ! \
    matroskamux ! \
    queue max-size-time=4000000000 ! \
    tcpserversink host=0.0.0.0 port=30000



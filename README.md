![Darknet Logo](http://pjreddie.com/media/files/darknet-black-small.png)

# Darknet #
Darknet is an open source neural network framework written in C and CUDA. It is fast, easy to install, and supports CPU and GPU computation.

For more information see the [Darknet project website](http://pjreddie.com/darknet).

For questions or issues please use the [Google Group](https://groups.google.com/forum/#!forum/darknet).

## Usage
Firstly, you need to clone this probject and build it:

```sh
git clone https://github.com/gaunthan/darknet.git
cd darknet
./build.sh # or make -j8
```

Then you can run `./darknet` to play with a lot of functionalities.

## Detection
Darknet supports detection on image or video (if OPENCV enabled).

In order to run detection model, you will need to download corresponding weight files.

For example, you can use the following command to download weight file for yolov3:

```sh
mkdir -p weights && cd weights
wget https://pjreddie.com/media/files/yolov3.weights
```

More information please refer to [YOLO: Real-Time Object Detection](https://pjreddie.com/darknet/yolo/).

### Detection on image
```sh
./darknet detect cfg/yolov3.cfg weights/yolov3.weights data/dog.jpg
```

### Detection on video
```sh
./darknet detector demo cfg/coco.data cfg/yolov3.cfg weights/yolov3.weights ~/dataset/TUM/rgbd_dataset_freiburg3_walking_xyz/video.mp4
```

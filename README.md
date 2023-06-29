# Bitrate Image Tester

![feature graphic](assets/feature_graphic.png)

![screenshot](readme_assets/screenshot.png)

## balancing file size and image clarity

![comparison](readme_assets/comparison.png)

![comparison 2](readme_assets/compare_2.png)

## bitrate

THETA X, 11K, HDR

| bitrate | filesize |
| ------- | -------- |
| 1,048,576 |  4.956MB |
| 5,242,880 | 6.594MB |
| 10,485,760 | 10.472MB |
| 20,971,520 | 21.047MB |

## file listing with file size

![file listing](readme_assets/file_list.png)

## 360 image navigation

![image with navigation](readme_assets/navigation.gif)

## setup

![distance](readme_assets/distance.png)

## theta-client

Example of setting options on the RICOH THETA 360 camera using the open source SDK
[theta-client](https://github.com/ricohapi/theta-client).

This is a modification of the theta-client demo for Flutter.

## Functions

* List photos in Theta.
* View sphere photo in Theta.
* Take a photo with Theta.
* Capture video with Theta.

## building and execution

```text
flutter pub get
flutter run
```

## Use in Automotive Sales

![automotive distance](readme_assets/car-distance.png)

![car placement](readme_assets/car-placement.png)

### THETA X

The X benefits from better HDR processing as well as higher resolution.

![theta x zoom](readme_assets/theta-x.png)

### SC2

We can likely take a better shot from the SC2.  The lighting was difficult as sun was
coming in from the window.

![SC2 car shot](readme_assets/sc2.png)

### Full size images from car interior (can be downloaded for close inspection)

THETA X, 11K, HDR

| bitrate - no HDR | filesize |  |
| ------- | -------- | -------- |
| 1,048,576 |  6MB |![X-1M-nohdr](test_images/X/R0010176-1M.JPG) |
| 5,242,880 | 7.2MB |![X-5M-nohdr](test_images/X/R0010177-5M.JPG) |
| 10,485,760 | 11.2MB |![X-10M-nohdr](test_images/X/R0010178-10M.JPG) |
| 20,971,520 | 19.5MB |![X-21M-nohdr](test_images/X/R0010179-21M.JPG) |

| bitrate - HDR | filesize |  |
| ------- | -------- | -------- |
| 1,048,576 |  4.9MB |![X-1M-nohdr](test_images/X/R0010180-1M.JPG) |
| 5,242,880 | 6.6MB |![X-5M-nohdr](test_images/X/R0010181-5M.JPG) |
| 10,485,760 | 11.4MB |![X-10M-nohdr](test_images/X/R0010182-10M.JPG) |
| 20,971,520 | 21.4MB |![X-21M-nohdr](test_images/X/R0010183-21M.JPG) |

SC2, 5.7K, no HDR

| filesize | |
| ------- | ------- | 
|  4.2MB |![SC2-nohdr](test_images/SC2/R0010010-SC2-NOHDR.JPG) |

SC2, 5.7K, HDR

| filesize | |
| ------- | ------- | 
|  4.2MB |![SC2-hdr](test_images/SC2/R0010011-SC2-HDR.JPG) |


## file listing with file size

![file listing](readme_assets/file_list.png)


## build information

```text
java --version
openjdk 19.0.2 2023-01-17
OpenJDK Runtime Environment (build 19.0.2+7-Ubuntu-0ubuntu322.04)
OpenJDK 64-Bit Server VM (build 19.0.2+7-Ubuntu-0ubuntu322.04, mixed mode, sharing)

echo $JAVA_HOME
/usr/lib/jvm/java-19-openjdk-amd64

```

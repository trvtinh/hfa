import 'dart:developer';
import 'dart:io';
import 'dart:math' hide log;
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter_vision/flutter_vision.dart';
import 'package:get/get.dart';
import 'package:image/image.dart' as img;
import 'package:path_provider/path_provider.dart';

import '../controller.dart';

class CropImage extends StatefulWidget {
  const CropImage({super.key});

  @override
  State<CropImage> createState() => _CropImageState();
}

class _CropImageState extends State<CropImage> {
  late FlutterVision vision;
  @override
  void initState() {
    super.initState();
    vision = FlutterVision();
  }

  @override
  void dispose() async {
    // Stop YOLO model in dispose
    await vision.closeYoloModel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: YoloVideo(vision: vision),
    );
  }
}

class YoloVideo extends StatefulWidget {
  final FlutterVision vision;
  const YoloVideo({super.key, required this.vision});

  @override
  State<YoloVideo> createState() => _YoloVideoState();
}

class _YoloVideoState extends State<YoloVideo> {
  late CameraController controller;
  late List<Map<String, dynamic>> yoloResults;
  bool isLoaded = false;
  bool isDetecting = false;
  final medicalController = Get.find<MedicalDataController>();

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    final cameras = await availableCameras();
    final camera = cameras.first;

    controller = CameraController(
      camera,
      ResolutionPreset.high,
      enableAudio: false,
    );
    await controller.initialize();

    await loadYoloModel();
    if (!mounted)
      return; // Check if widget is still in the tree before setting state
    setState(() {
      isLoaded = true;
      isDetecting = false;
      yoloResults = [];
    });
  }

  @override
  void dispose() {
    if (controller.value.isStreamingImages) {
      controller.stopImageStream(); // Ensure the image stream is stopped
    }
    controller.dispose(); // Dispose camera controller properly
    super.dispose();
  }

  Future<void> cropAndNavigate(
      CameraImage cameraImage, Map<String, dynamic> box) async {
    img.Image croppedImage = await cropCameraImage(cameraImage, box);
    medicalController.state.selectedFile.value =
        await saveImageToFile(croppedImage, 'cropped.jpg');
    if (mounted) Get.back();
  }

  Future<XFile> saveImageToFile(img.Image image, String filename) async {
    final directory = await getTemporaryDirectory();
    final filePath = '${directory.path}/$filename';

    File(filePath).writeAsBytesSync(img.encodeJpg(image));

    return XFile(filePath);
  }

  @override
  Widget build(BuildContext context) {
    Orientation deviceOrientation = MediaQuery.of(context).orientation;
    final Size size = MediaQuery.of(context).size;
    if (!isLoaded) {
      return const Scaffold(
        body: Center(
          child: Text("Model not loaded, waiting for it"),
        ),
      );
    }
    return Stack(
      fit: StackFit.expand,
      children: [
        Transform.rotate(
          angle: (controller.description.sensorOrientation -
                  (deviceOrientation == Orientation.portrait ? 90 : 90)) *
              pi /
              180,
          child: AspectRatio(
            aspectRatio: controller.value.aspectRatio,
            child: CameraPreview(controller),
          ),
        ),
        ...displayBoxesAroundRecognizedObjects(size),
        Positioned(
          bottom: 75,
          width: MediaQuery.of(context).size.width,
          child: Container(
            height: 80,
            width: 80,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                  width: 5, color: Colors.white, style: BorderStyle.solid),
            ),
            child: isDetecting
                ? IconButton(
                    onPressed: stopDetection,
                    icon: const Icon(
                      Icons.stop,
                      color: Colors.red,
                    ),
                    iconSize: 50,
                  )
                : IconButton(
                    onPressed: startDetection,
                    icon: const Icon(
                      Icons.play_arrow,
                      color: Colors.white,
                    ),
                    iconSize: 50,
                  ),
          ),
        ),
      ],
    );
  }

  Future<void> loadYoloModel() async {
    await widget.vision.loadYoloModel(
      labels: 'assets/AI_model/labels.txt',
      modelPath: 'assets/AI_model/best_float32.tflite',
      modelVersion: "yolov8",
      numThreads: 2,
      useGpu: true,
    );
  }

  img.Image _convertYUV420ToImage(CameraImage image) {
    final int width = image.width;
    final int height = image.height;

    final int yRowStride = image.planes[0].bytesPerRow;
    final int uvRowStride = image.planes[1].bytesPerRow;
    final int uvPixelStride = image.planes[1].bytesPerPixel!;

    final img.Image imghehe = img.Image(
      width: width,
      height: height,
    ); // Create Image buffer

    for (int y = 0; y < height; y++) {
      for (int x = 0; x < width; x++) {
        final int uvIndex = (y ~/ 2) * uvRowStride + (x ~/ 2) * uvPixelStride;
        final int yValue = image.planes[0].bytes[y * yRowStride + x];
        final int uValue = image.planes[1].bytes[uvIndex];
        final int vValue = image.planes[2].bytes[uvIndex];

        final int r =
            (yValue + (1.370705 * (vValue - 128))).toInt().clamp(0, 255);
        final int g =
            (yValue - (0.698001 * (vValue - 128)) - (0.337633 * (uValue - 128)))
                .toInt()
                .clamp(0, 255);
        final int b =
            (yValue + (1.732446 * (uValue - 128))).toInt().clamp(0, 255);

        imghehe.setPixel(x, y, imghehe.getColor(r, g, b));
      }
    }
    img.Image rotatedImage = img.copyRotate(imghehe,
        angle: controller.description.sensorOrientation);
    return rotatedImage;
  }

  Future<img.Image> cropCameraImage(
      CameraImage cameraImage, Map<String, dynamic> box) async {
    img.Image rgbImage = _convertYUV420ToImage(cameraImage);

    int imageWidth = rgbImage.width;
    int imageHeight = rgbImage.height;

    double boxX1 = box['box'][0];
    double boxY1 = box['box'][1];
    double boxX2 = box['box'][2];
    double boxY2 = box['box'][3];

    int x = boxX1.round();
    int y = boxY1.round();
    int width = (boxX2 - boxX1).round();
    int height = (boxY2 - boxY1).round();

    img.Image croppedImage = img.copyCrop(
      rgbImage,
      x: x.clamp(0, imageWidth - 1),
      y: y.clamp(0, imageHeight - 1),
      width: width.clamp(1, imageWidth - x),
      height: height.clamp(1, imageHeight - y),
    );

    return croppedImage;
  }

  Future<void> yoloOnFrame(CameraImage cameraImage) async {
    if (!mounted) return; // Prevent calling setState if widget is disposed
    final result = await widget.vision.yoloOnFrame(
      bytesList: cameraImage.planes.map((plane) => plane.bytes).toList(),
      imageHeight: cameraImage.height,
      imageWidth: cameraImage.width,
      iouThreshold: 0.4,
      confThreshold: 0.4,
      classThreshold: 0.5,
    );

    if (!mounted) return;
    if (result.isNotEmpty) {
      setState(() {
        yoloResults = result;
      });

      if (yoloResults.first['box'][4] > 0.9) {
        await cropAndNavigate(cameraImage, result.first);
      }
    }
  }

  Future<void> startDetection() async {
    setState(() {
      isDetecting = true;
    });
    if (controller.value.isStreamingImages) {
      return;
    }
    await controller.startImageStream((image) async {
      if (isDetecting) {
        yoloOnFrame(image); // Call YOLO on the frame
      }
    });
  }

  Future<void> stopDetection() async {
    setState(() {
      isDetecting = false;
      yoloResults.clear();
    });
    await controller.stopImageStream(); // Stop the image stream
  }

  List<Widget> displayBoxesAroundRecognizedObjects(Size screen) {
    if (yoloResults.isEmpty) return [];
    double factorX = screen.width;
    double factorY = screen.height;

    Color colorPick = Colors.pink;

    return yoloResults.map((result) {
      return Positioned(
        left: result['box'][0] * factorX,
        top: result['box'][1] * factorY,
        width: (result['box'][2] - result['box'][0]) * factorX,
        height: (result['box'][3] - result['box'][1]) * factorY,
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: colorPick,
              width: 3,
            ),
          ),
          child: Text(
            "${result['tag']} ${(result['box'][4] * 100).toStringAsFixed(0)}%",
            style: TextStyle(
              background: Paint()..color = colorPick,
              color: Colors.white,
              fontSize: 16,
            ),
          ),
        ),
      );
    }).toList();
  }
}

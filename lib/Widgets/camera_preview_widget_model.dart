import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class WorkingWithCameraPreviewModel extends ChangeNotifier {
  List<CameraDescription> cameras = [];
  CameraController? camera;

  Future<void> initalize() async {
    cameras = await availableCameras();

    print('\nAvailable Cameras:\n\n$cameras');

    camera = CameraController(
      cameras[1],
      ResolutionPreset.medium,
      enableAudio: false,
    );

    await camera?.initialize();
  }
}

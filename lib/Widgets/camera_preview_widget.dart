import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widgets/Widgets/camera_preview_widget_model.dart';
import 'package:native_device_orientation/native_device_orientation.dart';
import 'package:provider/provider.dart';

class WorkingWithCameraPreview extends StatelessWidget {
  const WorkingWithCameraPreview({super.key});

  @override
  Widget build(BuildContext context) => SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: const FittedBox(
              child: Text('Working With Camera Preview'),
            ),
          ),
          body: NativeDeviceOrientationReader(builder: (BuildContext context) {
            NativeDeviceOrientation orientation = NativeDeviceOrientationReader.orientation(context);
            int turns;

            switch (orientation) {
              case NativeDeviceOrientation.landscapeLeft:
                turns = -1;
                break;

              case NativeDeviceOrientation.landscapeRight:
                turns = 1;
                break;

              case NativeDeviceOrientation.portraitDown:
                turns = 2;
                break;

              default:
                turns = 0;
            }

            return Consumer(
              builder: (BuildContext context, WorkingWithCameraPreviewModel model, _) {
                return (model.camera?.value.isInitialized ?? false)
                    ? RotatedBox(
                        quarterTurns: turns,
                        child: Transform.scale(
                          scale: 1 / model.camera!.value.aspectRatio,
                          child: Center(
                            child: AspectRatio(
                              aspectRatio: model.camera!.value.aspectRatio,
                              child: CameraPreview(model.camera as CameraController),
                            ),
                          ),
                        ),
                      )
                    : _circleLoader;
              },
            );
          }),
        ),
      );
}

const _circleLoader = CircularProgressIndicator(
  color: Color.fromRGBO(0, 34, 84, 1),
);

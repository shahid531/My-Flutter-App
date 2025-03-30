import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

import 'display_picture_screen.dart';

class CameraUi extends StatefulWidget {
  const CameraUi({super.key});

  @override
  State<CameraUi> createState() => _CameraUiState();
}

class _CameraUiState extends State<CameraUi> {
  CameraController? _controller;
  List<CameraDescription>? _cameras;
  bool _isCameraInitialized = false;

  @override
  void initState() {
    initializeCamera();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              child: Container(
                color: Colors.white,
                child: _isCameraInitialized ? CameraPreview(_controller!): Center(child: CircularProgressIndicator()),
              ),
            ),
            TextButton(
              onPressed: () async {
                await captureImage();
              },
              child: Text('Capture'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> initializeCamera() async {
    _cameras = await availableCameras();
    _controller = CameraController(_cameras!.first, ResolutionPreset.medium);

    await _controller!.initialize();
    setState(() {
      _isCameraInitialized = true;
    });
  }

  Future<void> captureImage() async {
    final image = await _controller!.takePicture();
    if (!context.mounted) return;
    await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => DisplayPictureScreen(imagePath: image.path),
      ),
    );
  }
}

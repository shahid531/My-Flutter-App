import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:my_flutter_app/main.dart';

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
        body: Center(
          child: TextButton(onPressed: ()async{
            await captureImage();
          }, child: Text('Camera')),
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
  print("Image saved at: ${image.path}");
}

}
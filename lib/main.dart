import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:my_flutter_app/notification/local_notification.dart';
import 'package:my_flutter_app/ui/camera_ui.dart';
import 'package:my_flutter_app/ui/notify_ui.dart';
import 'package:my_flutter_app/ui/permission_ui.dart';
import 'package:my_flutter_app/ui/pref_ui.dart' show PrefUi;
import 'package:my_flutter_app/ui/sqflite_ui.dart';

late List<CameraDescription> camerasList;
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await LocalNotification.initialize();
  camerasList = await availableCameras();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CameraUi()
    );
  }
}
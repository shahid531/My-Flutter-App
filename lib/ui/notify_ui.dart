import 'package:flutter/material.dart';
import 'package:my_flutter_app/notification/local_notification.dart';

class NotifyUi extends StatefulWidget {
  const NotifyUi({super.key});

  @override
  State<NotifyUi> createState() => _NotifyUiState();
}

class _NotifyUiState extends State<NotifyUi> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: TextButton(onPressed: (){
            LocalNotification.showNotification();
          }, child: CircularProgressIndicator()),
        ),
      ),
    );
  }
}
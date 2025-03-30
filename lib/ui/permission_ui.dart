import 'package:flutter/material.dart';

class PermissionUi extends StatefulWidget {
  const PermissionUi({super.key});

  @override
  State<PermissionUi> createState() => _PermissionUiState();
}

class _PermissionUiState extends State<PermissionUi> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.amber,
        body: Image.asset('assets/images/ios_flutter_logo.png'),
        ),
    );
  }
}
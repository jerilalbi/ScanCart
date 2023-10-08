import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:scancart/core/colors/colors.dart';
import 'package:scancart/infrastructure/services/camera_service.dart';

class ScanPage extends StatefulWidget {
  static String routeName = "scan";
  const ScanPage({super.key});

  @override
  State<ScanPage> createState() => _ScanPageState();
}

class _ScanPageState extends State<ScanPage> {
late CameraController controller;

void didChangeAppLifecycleState(AppLifecycleState state) {
  final CameraController? cameraController = controller;
  if (cameraController == null || !cameraController.value.isInitialized) {
    return;
  }

  if (state == AppLifecycleState.inactive) {
    cameraController.dispose();
  } else if (state == AppLifecycleState.resumed) {
    initializeCameraController();
  }
}

void initializeCameraController(){
  controller = CameraController(cameras[0],ResolutionPreset.max);
  controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    }).catchError((Object e) {
      if (e is CameraException) {
        switch (e.code) {
          case 'CameraAccessDenied':
            break;
          default:
            break;
        }
      }
    });
}

@override
  void initState() {
    super.initState();
    initializeCameraController();
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: tertiaryColor,
      body: Center(
        child: Container(
          height: MediaQuery.of(context).size.height *.4,
          width: MediaQuery.of(context).size.width*.8,
          color: primaryColor,
          child: CameraPreview(controller),
        ),
      ),
    );
  }
}
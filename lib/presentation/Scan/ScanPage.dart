import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scancart/application/bloc/Camera/camera_bloc.dart';
import 'package:scancart/core/colors/colors.dart';
import 'package:scancart/infrastructure/services/camera_service.dart';

class ScanPage extends StatefulWidget {
  static String routeName = "scan";
  const ScanPage({super.key});

  @override
  State<ScanPage> createState() => _ScanPageState();
}

class _ScanPageState extends State<ScanPage> with WidgetsBindingObserver {

  @override
  void initState() {
    super.initState();
    context.read<CameraBloc>().add(InitializeCamera());
  }
  
  void didChangeAppLifecycleState(AppLifecycleState state) {
    final bloc = BlocProvider.of<CameraBloc>(context);
    if (!bloc.state.cameraController!.value.isInitialized) return;

    if (state == AppLifecycleState.inactive){
      bloc.add(DisposeCamera());
    }

    else if (state == AppLifecycleState.resumed) {
      bloc.add(InitializeCamera());
      }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CameraBloc, CameraState>(
      listener: (context, state) {
        
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: tertiaryColor,
          body: Center(
            child: Container(
              height: MediaQuery.of(context).size.height * .4,
              width: MediaQuery.of(context).size.width * .8,
              color: primaryColor,
              child: BlocBuilder<CameraBloc, CameraState>(
                builder: (context, state) {
                  return CameraPreview( state.isCameraInitialize! ? state.cameraController! : CameraController(cameras[0], ResolutionPreset.max));
                },
              ),
            ),
          ),
        );
      },
    );
  }
}

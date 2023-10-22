import 'package:bloc/bloc.dart';
import 'package:camera/camera.dart';
import 'package:meta/meta.dart';
import 'package:scancart/infrastructure/services/camera_service.dart';

part 'camera_event.dart';
part 'camera_state.dart';

class CameraBloc extends Bloc<CameraEvent, CameraState> {
  CameraBloc() : super(CameraInitial()) {

    on<InitializeCamera>((event, emit) async {
     CameraController? blocCameraController = await  initializeCameraController(cameraController: state.cameraController);
     emit(CameraState(cameraController: blocCameraController,isCameraInitialize: true)); 
    });

    on<DisposeCamera>((event, emit) {
      print("camera closing section");
      state.cameraController!.dispose();
      print("camera closed program");
      },);
  }
}

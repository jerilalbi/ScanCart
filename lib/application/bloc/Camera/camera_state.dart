part of 'camera_bloc.dart';

class CameraState {
  final CameraController? cameraController;
  final bool? isCameraInitialize;
  CameraState({this.cameraController,this.isCameraInitialize});
}

final class CameraInitial extends CameraState {
  CameraInitial() : super(cameraController: CameraController(cameras[0],ResolutionPreset.max),isCameraInitialize: false);
}

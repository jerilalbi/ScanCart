part of 'camera_bloc.dart';

@immutable
sealed class CameraEvent {}

class InitializeCamera extends CameraEvent{}

class DisposeCamera extends CameraEvent{}

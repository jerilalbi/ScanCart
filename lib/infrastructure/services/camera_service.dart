import 'package:camera/camera.dart';

late List<CameraDescription> cameras;

Future<CameraController?> initializeCameraController({CameraController? cameraController}) async{
  // cameraController = CameraController(cameras[0],ResolutionPreset.max);
  try{
    await cameraController!.initialize();
    if(cameraController.value.isInitialized){
      return cameraController;
    }
  } on CameraException catch(e){
    print(e.description);
  }catch(e){
    print(e);
  }
  throw Exception();
}
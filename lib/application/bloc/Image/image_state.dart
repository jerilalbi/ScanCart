part of 'image_bloc.dart';

class ImageState {
  final int? index;
  ImageState({this.index});
}

final class ImageInitial extends ImageState {
  ImageInitial():super(index: 0);
}

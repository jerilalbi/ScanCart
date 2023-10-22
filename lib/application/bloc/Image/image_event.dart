part of 'image_bloc.dart';

@immutable
sealed class ImageEvent {}

class ChangeImageIndex extends ImageEvent{
  final int index;
  ChangeImageIndex({required this.index});
}

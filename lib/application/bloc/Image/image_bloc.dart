import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'image_event.dart';
part 'image_state.dart';

class ImageBloc extends Bloc<ImageEvent, ImageState> {
  ImageBloc() : super(ImageInitial()) {
    on<ChangeImageIndex>((event, emit) {
      emit(ImageState(index: state.index! + 1));
    });
  }
}

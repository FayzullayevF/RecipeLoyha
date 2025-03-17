import 'dart:io';

import 'package:chef_staff/reviews/presentation/manager/create_review/create_review_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

part 'create_review_event.dart';

class CreateReviewBloc extends Bloc<CreateReviewEvent, CreateReviewState> {
  CreateReviewBloc()
      : super(CreateReviewState.initial()) {
    on<CreateReviewRate>(_onRate);
    on<CreateReviewPickImage>(_onPickedImage);
  }

  Future<void> _onRate(
      CreateReviewRate event, Emitter<CreateReviewState> emit) async {
    emit(state.copyWith(
        currentIndex: event.currentIndex, status: CreateReviewStatus.idle));
  }

  Future<void> _onPickedImage(
      CreateReviewEvent event, Emitter<CreateReviewState> emit) async {
    File? image;
    final imagePicker = ImagePicker();
    final pickedImage =
        await imagePicker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      image = File(pickedImage.path);
      emit(state.copyWith(pickedImage: image));
    }
  }
}

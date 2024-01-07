// ignore_for_file: must_be_immutable

part of 'write_a_review_bloc.dart';

/// Represents the state of WriteAReview in the application.
class WriteAReviewState extends Equatable {
  WriteAReviewState({
    this.inputFieldsController,
    this.writeAReviewModelObj,
  });

  TextEditingController? inputFieldsController;

  WriteAReviewModel? writeAReviewModelObj;

  @override
  List<Object?> get props => [
        inputFieldsController,
        writeAReviewModelObj,
      ];
  WriteAReviewState copyWith({
    TextEditingController? inputFieldsController,
    WriteAReviewModel? writeAReviewModelObj,
  }) {
    return WriteAReviewState(
      inputFieldsController:
          inputFieldsController ?? this.inputFieldsController,
      writeAReviewModelObj: writeAReviewModelObj ?? this.writeAReviewModelObj,
    );
  }
}

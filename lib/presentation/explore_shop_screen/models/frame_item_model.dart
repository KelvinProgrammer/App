// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

/// This class is used in the [frame_item_widget] screen.
class FrameItemModel extends Equatable {
  FrameItemModel({
    this.tabs,
    this.isSelected,
  }) {
    tabs = tabs ?? "Electonics";
    isSelected = isSelected ?? false;
  }

  String? tabs;

  bool? isSelected;

  FrameItemModel copyWith({
    String? tabs,
    bool? isSelected,
  }) {
    return FrameItemModel(
      tabs: tabs ?? this.tabs,
      isSelected: isSelected ?? this.isSelected,
    );
  }

  @override
  List<Object?> get props => [tabs, isSelected];
}

// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

/// This class is used in the [frame4_item_widget] screen.
class Frame4ItemModel extends Equatable {
  Frame4ItemModel({
    this.tabs,
    this.isSelected,
  }) {
    tabs = tabs ?? "S";
    isSelected = isSelected ?? false;
  }

  String? tabs;

  bool? isSelected;

  Frame4ItemModel copyWith({
    String? tabs,
    bool? isSelected,
  }) {
    return Frame4ItemModel(
      tabs: tabs ?? this.tabs,
      isSelected: isSelected ?? this.isSelected,
    );
  }

  @override
  List<Object?> get props => [tabs, isSelected];
}

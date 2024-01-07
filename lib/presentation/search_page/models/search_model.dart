// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import '../../../core/app_export.dart';
import 'frame6_item_model.dart';
import 'frame7_item_model.dart';

/// This class defines the variables used in the [search_page],
/// and is typically used to hold data that is passed between different parts of the application.
class SearchModel extends Equatable {
  SearchModel({
    this.frame6ItemList = const [],
    this.frame7ItemList = const [],
  }) {}

  List<Frame6ItemModel> frame6ItemList;

  List<Frame7ItemModel> frame7ItemList;

  SearchModel copyWith({
    List<Frame6ItemModel>? frame6ItemList,
    List<Frame7ItemModel>? frame7ItemList,
  }) {
    return SearchModel(
      frame6ItemList: frame6ItemList ?? this.frame6ItemList,
      frame7ItemList: frame7ItemList ?? this.frame7ItemList,
    );
  }

  @override
  List<Object?> get props => [frame6ItemList, frame7ItemList];
}

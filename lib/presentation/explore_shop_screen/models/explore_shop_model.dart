// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import 'frame_item_model.dart';

/// This class defines the variables used in the [explore_shop_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class ExploreShopModel extends Equatable {
  ExploreShopModel({this.frameItemList = const []}) {}

  List<FrameItemModel> frameItemList;

  ExploreShopModel copyWith({List<FrameItemModel>? frameItemList}) {
    return ExploreShopModel(
      frameItemList: frameItemList ?? this.frameItemList,
    );
  }

  @override
  List<Object?> get props => [frameItemList];
}

// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import '../../../core/app_export.dart';
import 'popularitems_item_model.dart';

/// This class defines the variables used in the [popular_items_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class PopularItemsModel extends Equatable {
  PopularItemsModel({this.popularitemsItemList = const []}) {}

  List<PopularitemsItemModel> popularitemsItemList;

  PopularItemsModel copyWith(
      {List<PopularitemsItemModel>? popularitemsItemList}) {
    return PopularItemsModel(
      popularitemsItemList: popularitemsItemList ?? this.popularitemsItemList,
    );
  }

  @override
  List<Object?> get props => [popularitemsItemList];
}

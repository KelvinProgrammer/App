// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import '../../../core/app_export.dart';
import 'discountitems_item_model.dart';

/// This class defines the variables used in the [discount_items_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class DiscountItemsModel extends Equatable {
  DiscountItemsModel({this.discountitemsItemList = const []}) {}

  List<DiscountitemsItemModel> discountitemsItemList;

  DiscountItemsModel copyWith(
      {List<DiscountitemsItemModel>? discountitemsItemList}) {
    return DiscountItemsModel(
      discountitemsItemList:
          discountitemsItemList ?? this.discountitemsItemList,
    );
  }

  @override
  List<Object?> get props => [discountitemsItemList];
}

// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import 'unsplashvfrcrteqkleight_item_model.dart';
import '../../../core/app_export.dart';
import 'orderstatus_item_model.dart';

/// This class defines the variables used in the [order_status_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class OrderStatusModel extends Equatable {
  OrderStatusModel({
    this.unsplashvfrcrteqkleightItemList = const [],
    this.orderstatusItemList = const [],
  }) {}

  List<UnsplashvfrcrteqkleightItemModel> unsplashvfrcrteqkleightItemList;

  List<OrderstatusItemModel> orderstatusItemList;

  OrderStatusModel copyWith({
    List<UnsplashvfrcrteqkleightItemModel>? unsplashvfrcrteqkleightItemList,
    List<OrderstatusItemModel>? orderstatusItemList,
  }) {
    return OrderStatusModel(
      unsplashvfrcrteqkleightItemList: unsplashvfrcrteqkleightItemList ??
          this.unsplashvfrcrteqkleightItemList,
      orderstatusItemList: orderstatusItemList ?? this.orderstatusItemList,
    );
  }

  @override
  List<Object?> get props =>
      [unsplashvfrcrteqkleightItemList, orderstatusItemList];
}

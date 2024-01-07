// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import '../../../core/app_export.dart';
import 'mycart_item_model.dart';

/// This class defines the variables used in the [my_cart_page],
/// and is typically used to hold data that is passed between different parts of the application.
class MyCartModel extends Equatable {
  MyCartModel({this.mycartItemList = const []}) {}

  List<MycartItemModel> mycartItemList;

  MyCartModel copyWith({List<MycartItemModel>? mycartItemList}) {
    return MyCartModel(
      mycartItemList: mycartItemList ?? this.mycartItemList,
    );
  }

  @override
  List<Object?> get props => [mycartItemList];
}

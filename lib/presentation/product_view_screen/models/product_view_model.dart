// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import 'frame4_item_model.dart';

/// This class defines the variables used in the [product_view_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class ProductViewModel extends Equatable {
  ProductViewModel({this.frame4ItemList = const []}) {}

  List<Frame4ItemModel> frame4ItemList;

  ProductViewModel copyWith({List<Frame4ItemModel>? frame4ItemList}) {
    return ProductViewModel(
      frame4ItemList: frame4ItemList ?? this.frame4ItemList,
    );
  }

  @override
  List<Object?> get props => [frame4ItemList];
}

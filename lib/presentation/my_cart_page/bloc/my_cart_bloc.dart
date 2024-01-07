import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import '../models/mycart_item_model.dart';
import 'package:kelvin_s_application1/presentation/my_cart_page/models/my_cart_model.dart';
part 'my_cart_event.dart';
part 'my_cart_state.dart';

/// A bloc that manages the state of a MyCart according to the event that is dispatched to it.
class MyCartBloc extends Bloc<MyCartEvent, MyCartState> {
  MyCartBloc(MyCartState initialState) : super(initialState) {
    on<MyCartInitialEvent>(_onInitialize);
  }

  _onInitialize(
    MyCartInitialEvent event,
    Emitter<MyCartState> emit,
  ) async {
    emit(state.copyWith(
        myCartModelObj: state.myCartModelObj
            ?.copyWith(mycartItemList: fillMycartItemList())));
  }

  List<MycartItemModel> fillMycartItemList() {
    return [
      MycartItemModel(
          jacket: ImageConstant.imgUnsplash8hqpxttomn0,
          jacket1: "Jacket",
          blackJacket: "Black Jacket",
          sizeXL: "Size: XL",
          one: "1"),
      MycartItemModel(
          jacket: ImageConstant.imgUnsplash8hqpxttomn0171x142,
          jacket1: "Casual",
          blackJacket: "Casual Jeans Shoes",
          sizeXL: "Size: XL",
          one: "1")
    ];
  }
}

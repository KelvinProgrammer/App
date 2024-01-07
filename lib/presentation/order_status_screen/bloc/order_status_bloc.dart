import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import '../models/unsplashvfrcrteqkleight_item_model.dart';
import '../models/orderstatus_item_model.dart';
import 'package:kelvin_s_application1/presentation/order_status_screen/models/order_status_model.dart';
part 'order_status_event.dart';
part 'order_status_state.dart';

/// A bloc that manages the state of a OrderStatus according to the event that is dispatched to it.
class OrderStatusBloc extends Bloc<OrderStatusEvent, OrderStatusState> {
  OrderStatusBloc(OrderStatusState initialState) : super(initialState) {
    on<OrderStatusInitialEvent>(_onInitialize);
  }

  List<UnsplashvfrcrteqkleightItemModel> fillUnsplashvfrcrteqkleightItemList() {
    return List.generate(1, (index) => UnsplashvfrcrteqkleightItemModel());
  }

  List<OrderstatusItemModel> fillOrderstatusItemList() {
    return [
      OrderstatusItemModel(
          orderReceived: ImageConstant.imgSettings,
          orderReceived1: "Order Received",
          time: "05:48 PM, 7 June 2021"),
      OrderstatusItemModel(
          orderReceived: ImageConstant.imgSettings,
          orderReceived1: "On The Way",
          time: "05:55 PM, 7 June 2021"),
      OrderstatusItemModel(
          orderReceived: ImageConstant.imgUserLime900,
          orderReceived1: "Delivered",
          time: "Finish Time In 25 Min")
    ];
  }

  _onInitialize(
    OrderStatusInitialEvent event,
    Emitter<OrderStatusState> emit,
  ) async {
    emit(state.copyWith(sliderIndex: 0));
    emit(state.copyWith(
        orderStatusModelObj: state.orderStatusModelObj?.copyWith(
            unsplashvfrcrteqkleightItemList:
                fillUnsplashvfrcrteqkleightItemList(),
            orderstatusItemList: fillOrderstatusItemList())));
  }
}

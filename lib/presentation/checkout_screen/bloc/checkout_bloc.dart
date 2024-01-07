import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import '../models/checkout_item_model.dart';
import 'package:kelvin_s_application1/presentation/checkout_screen/models/checkout_model.dart';
part 'checkout_event.dart';
part 'checkout_state.dart';

/// A bloc that manages the state of a Checkout according to the event that is dispatched to it.
class CheckoutBloc extends Bloc<CheckoutEvent, CheckoutState> {
  CheckoutBloc(CheckoutState initialState) : super(initialState) {
    on<CheckoutInitialEvent>(_onInitialize);
  }

  _onInitialize(
    CheckoutInitialEvent event,
    Emitter<CheckoutState> emit,
  ) async {
    emit(state.copyWith(
        checkoutModelObj: state.checkoutModelObj
            ?.copyWith(checkoutItemList: fillCheckoutItemList())));
  }

  List<CheckoutItemModel> fillCheckoutItemList() {
    return [
      CheckoutItemModel(
          creditCard: ImageConstant.imgUser, creditCard1: "Credit Card"),
      CheckoutItemModel(
          creditCard: ImageConstant.imgFlatcoloriconsgoogle,
          creditCard1: "Google Pay"),
      CheckoutItemModel(
          creditCard: ImageConstant.imgUimapple, creditCard1: "Apple Pay"),
      CheckoutItemModel(
          creditCard: ImageConstant.imgTelevision, creditCard1: "Paypal")
    ];
  }
}

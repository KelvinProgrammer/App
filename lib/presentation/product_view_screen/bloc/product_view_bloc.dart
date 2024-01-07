import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import '../models/frame4_item_model.dart';
import 'package:kelvin_s_application1/presentation/product_view_screen/models/product_view_model.dart';
part 'product_view_event.dart';
part 'product_view_state.dart';

/// A bloc that manages the state of a ProductView according to the event that is dispatched to it.
class ProductViewBloc extends Bloc<ProductViewEvent, ProductViewState> {
  ProductViewBloc(ProductViewState initialState) : super(initialState) {
    on<ProductViewInitialEvent>(_onInitialize);
    on<UpdateChipViewEvent>(_updateChipView);
  }

  _onInitialize(
    ProductViewInitialEvent event,
    Emitter<ProductViewState> emit,
  ) async {
    emit(state.copyWith(
        productViewModelObj: state.productViewModelObj
            ?.copyWith(frame4ItemList: fillFrame4ItemList())));
  }

  _updateChipView(
    UpdateChipViewEvent event,
    Emitter<ProductViewState> emit,
  ) {
    List<Frame4ItemModel> newList =
        List<Frame4ItemModel>.from(state.productViewModelObj!.frame4ItemList);
    newList[event.index] =
        newList[event.index].copyWith(isSelected: event.isSelected);
    emit(state.copyWith(
        productViewModelObj:
            state.productViewModelObj?.copyWith(frame4ItemList: newList)));
  }

  List<Frame4ItemModel> fillFrame4ItemList() {
    return List.generate(5, (index) => Frame4ItemModel());
  }
}

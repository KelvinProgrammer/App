import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import '../models/popularitems_item_model.dart';
import 'package:kelvin_s_application1/presentation/popular_items_screen/models/popular_items_model.dart';
part 'popular_items_event.dart';
part 'popular_items_state.dart';

/// A bloc that manages the state of a PopularItems according to the event that is dispatched to it.
class PopularItemsBloc extends Bloc<PopularItemsEvent, PopularItemsState> {
  PopularItemsBloc(PopularItemsState initialState) : super(initialState) {
    on<PopularItemsInitialEvent>(_onInitialize);
  }

  _onInitialize(
    PopularItemsInitialEvent event,
    Emitter<PopularItemsState> emit,
  ) async {
    emit(state.copyWith(
        popularItemsModelObj: state.popularItemsModelObj
            ?.copyWith(popularitemsItemList: fillPopularitemsItemList())));
  }

  List<PopularitemsItemModel> fillPopularitemsItemList() {
    return [
      PopularitemsItemModel(
          blackJacket: ImageConstant.imgUnsplashEmlkhdeydhg4,
          casualJeansShoes: "Black Jacket"),
      PopularitemsItemModel(
          blackJacket: ImageConstant.imgUnsplashEmlkhdeydhg5,
          casualJeansShoes: "Black Jacket"),
      PopularitemsItemModel(
          blackJacket: ImageConstant.imgUnsplashEmlkhdeydhg6,
          casualJeansShoes: "Black Jacket"),
      PopularitemsItemModel(
          blackJacket: ImageConstant.imgUnsplashEmlkhdeydhg7,
          casualJeansShoes: "Black Jacket")
    ];
  }
}

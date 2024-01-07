import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import '../models/frame2_item_model.dart';
import '../models/frame3_item_model.dart';
import 'package:kelvin_s_application1/presentation/home_page/models/home_model.dart';
part 'home_event.dart';
part 'home_state.dart';

/// A bloc that manages the state of a Home according to the event that is dispatched to it.
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc(HomeState initialState) : super(initialState) {
    on<HomeInitialEvent>(_onInitialize);
  }

  _onInitialize(
    HomeInitialEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(state.copyWith(
        homeModelObj: state.homeModelObj?.copyWith(
            frame2ItemList: fillFrame2ItemList(),
            frame3ItemList: fillFrame3ItemList())));
  }

  List<Frame2ItemModel> fillFrame2ItemList() {
    return [
      Frame2ItemModel(
          casualJeansShoes: ImageConstant.imgUnsplashEmlkhdeydhg,
          casualJeansShoes1: "Casual Jeans Shoes"),
      Frame2ItemModel(
          casualJeansShoes: ImageConstant.imgUnsplashEmlkhdeydhg235x164,
          casualJeansShoes1: "Casual Jeans Shoes"),
      Frame2ItemModel(
          casualJeansShoes: ImageConstant.imgUnsplashEmlkhdeydhg1,
          casualJeansShoes1: "Casual Jeans Shoes")
    ];
  }

  List<Frame3ItemModel> fillFrame3ItemList() {
    return [
      Frame3ItemModel(
          blackJacket: ImageConstant.imgUnsplashEmlkhdeydhg2,
          casualJeansShoes: "Black Jacket"),
      Frame3ItemModel(
          blackJacket: ImageConstant.imgUnsplashEmlkhdeydhg3,
          casualJeansShoes: "Casual Jeans Shoes"),
      Frame3ItemModel(
          blackJacket: ImageConstant.imgUnsplashEmlkhdeydhg2,
          casualJeansShoes: "Black Jacket")
    ];
  }
}

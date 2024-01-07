import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import '../models/frame6_item_model.dart';
import '../models/frame7_item_model.dart';
import 'package:kelvin_s_application1/presentation/search_page/models/search_model.dart';
part 'search_event.dart';
part 'search_state.dart';

/// A bloc that manages the state of a Search according to the event that is dispatched to it.
class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc(SearchState initialState) : super(initialState) {
    on<SearchInitialEvent>(_onInitialize);
  }

  List<Frame6ItemModel> fillFrame6ItemList() {
    return [
      Frame6ItemModel(unsplashQnUURoX: ImageConstant.imgUnsplashQnuUr0o5x8),
      Frame6ItemModel(
          unsplashQnUURoX: ImageConstant.imgUnsplashQnuUr0o5x858x58),
      Frame6ItemModel(unsplashQnUURoX: ImageConstant.imgUnsplashQnuUr0o5x81),
      Frame6ItemModel(unsplashQnUURoX: ImageConstant.imgUnsplashQnuUr0o5x82),
      Frame6ItemModel(unsplashQnUURoX: ImageConstant.imgUnsplashQnuUr0o5x83)
    ];
  }

  List<Frame7ItemModel> fillFrame7ItemList() {
    return [
      Frame7ItemModel(
          premiumWatch: ImageConstant.imgUnsplashJj0tls2rod4,
          premiumWatch1: "Premium Watch"),
      Frame7ItemModel(
          premiumWatch: ImageConstant.imgUnsplashJj0tls2rod458x58,
          premiumWatch1: "Blue shoes"),
      Frame7ItemModel(
          premiumWatch: ImageConstant.imgUnsplashJj0tls2rod41,
          premiumWatch1: "Jamdan Dress")
    ];
  }

  _onInitialize(
    SearchInitialEvent event,
    Emitter<SearchState> emit,
  ) async {
    emit(state.copyWith(
      searchController: TextEditingController(),
    ));
    emit(state.copyWith(
        searchModelObj: state.searchModelObj?.copyWith(
      frame6ItemList: fillFrame6ItemList(),
      frame7ItemList: fillFrame7ItemList(),
    )));
  }
}

import '../popular_items_screen/widgets/popularitems_item_widget.dart';
import 'bloc/popular_items_bloc.dart';
import 'models/popular_items_model.dart';
import 'models/popularitems_item_model.dart';
import 'package:flutter/material.dart';
import 'package:kelvin_s_application1/core/app_export.dart';
import 'package:kelvin_s_application1/widgets/app_bar/appbar_leading_iconbutton_one.dart';
import 'package:kelvin_s_application1/widgets/app_bar/appbar_subtitle_one.dart';
import 'package:kelvin_s_application1/widgets/app_bar/appbar_trailing_image.dart';
import 'package:kelvin_s_application1/widgets/app_bar/custom_app_bar.dart';

class PopularItemsScreen extends StatelessWidget {
  const PopularItemsScreen({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return BlocProvider<PopularItemsBloc>(
        create: (context) => PopularItemsBloc(
            PopularItemsState(popularItemsModelObj: PopularItemsModel()))
          ..add(PopularItemsInitialEvent()),
        child: PopularItemsScreen());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: _buildAppBar(context),
            body: Padding(
                padding: EdgeInsets.only(left: 16.h, top: 24.v, right: 16.h),
                child: BlocSelector<PopularItemsBloc, PopularItemsState,
                        PopularItemsModel?>(
                    selector: (state) => state.popularItemsModelObj,
                    builder: (context, popularItemsModelObj) {
                      return GridView.builder(
                          shrinkWrap: true,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  mainAxisExtent: 293.v,
                                  crossAxisCount: 2,
                                  mainAxisSpacing: 15.h,
                                  crossAxisSpacing: 15.h),
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: popularItemsModelObj
                                  ?.popularitemsItemList.length ??
                              0,
                          itemBuilder: (context, index) {
                            PopularitemsItemModel model = popularItemsModelObj
                                    ?.popularitemsItemList[index] ??
                                PopularitemsItemModel();
                            return PopularitemsItemWidget(model, onTapCard: () {
                              onTapCard(context);
                            });
                          });
                    }))));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        leadingWidth: 56.h,
        leading: AppbarLeadingIconbuttonOne(
            imagePath: ImageConstant.imgArrowDown,
            margin: EdgeInsets.only(left: 16.h, top: 5.v, bottom: 5.v),
            onTap: () {
              onTapArrowDown(context);
            }),
        centerTitle: true,
        title: AppbarSubtitleOne(text: "lbl_popular_items".tr),
        actions: [
          AppbarTrailingImage(
              imagePath: ImageConstant.imgSearch,
              margin: EdgeInsets.symmetric(horizontal: 16.h, vertical: 13.v))
        ]);
  }

  /// Navigates to the productViewScreen when the action is triggered.
  onTapCard(BuildContext context) {
    NavigatorService.pushNamed(AppRoutes.productViewScreen);
  }

  /// Navigates to the previous screen.
  onTapArrowDown(BuildContext context) {
    NavigatorService.goBack();
  }
}

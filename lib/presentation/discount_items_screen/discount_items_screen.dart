import '../discount_items_screen/widgets/discountitems_item_widget.dart';
import 'bloc/discount_items_bloc.dart';
import 'models/discount_items_model.dart';
import 'models/discountitems_item_model.dart';
import 'package:flutter/material.dart';
import 'package:kelvin_s_application1/core/app_export.dart';
import 'package:kelvin_s_application1/widgets/app_bar/appbar_leading_iconbutton_one.dart';
import 'package:kelvin_s_application1/widgets/app_bar/appbar_subtitle_one.dart';
import 'package:kelvin_s_application1/widgets/app_bar/custom_app_bar.dart';

class DiscountItemsScreen extends StatelessWidget {
  const DiscountItemsScreen({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return BlocProvider<DiscountItemsBloc>(
        create: (context) => DiscountItemsBloc(
            DiscountItemsState(discountItemsModelObj: DiscountItemsModel()))
          ..add(DiscountItemsInitialEvent()),
        child: DiscountItemsScreen());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: _buildAppBar(context),
            body: Padding(
                padding: EdgeInsets.only(left: 16.h, top: 24.v, right: 16.h),
                child: BlocSelector<DiscountItemsBloc, DiscountItemsState,
                        DiscountItemsModel?>(
                    selector: (state) => state.discountItemsModelObj,
                    builder: (context, discountItemsModelObj) {
                      return ListView.separated(
                          physics: BouncingScrollPhysics(),
                          shrinkWrap: true,
                          separatorBuilder: (context, index) {
                            return SizedBox(height: 14.v);
                          },
                          itemCount: discountItemsModelObj
                                  ?.discountitemsItemList.length ??
                              0,
                          itemBuilder: (context, index) {
                            DiscountitemsItemModel model = discountItemsModelObj
                                    ?.discountitemsItemList[index] ??
                                DiscountitemsItemModel();
                            return DiscountitemsItemWidget(model);
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
        title: AppbarSubtitleOne(text: "lbl_discount_items".tr));
  }

  /// Navigates to the previous screen.
  onTapArrowDown(BuildContext context) {
    NavigatorService.goBack();
  }
}
